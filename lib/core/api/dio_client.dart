import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';

typedef ResponseConverter<T> = T Function(dynamic response);

class DioClient with MainBoxMixin, FirebaseCrashLogger {
  final String baseUrl;

  final bool _isUnitTest;
  late final Dio _dio = _createDio();

  DioClient({this._isUnitTest = false, String? baseUrl})
    : baseUrl = baseUrl ?? const String.fromEnvironment('BASE_URL');

  String? token() =>
      getData<String?>(MainBoxKeys.authToken) ??
      getData<String?>(MainBoxKeys.generalToken);

  /// Unit tests get one static instance so a mock adapter can be attached.
  /// The app recreates Dio per call so the latest token is always sent.
  Dio get dio => _isUnitTest ? _dio : _createDio();

  Dio _createDio() {
    final token = this.token();
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': ?token,
        },
        receiveTimeout: const Duration(minutes: 1),
        connectTimeout: const Duration(minutes: 1),
        validateStatus: (int? status) => (status ?? 0) > 0,
      ),
    );
    if (!_isUnitTest) {
      dio.interceptors.add(DioInterceptor()); // coverage:ignore-line
    }
    return dio;
  }

  Future<Either<Failure, T>> getRequest<T>(
    String url, {
    required ResponseConverter<T> converter,
    Map<String, dynamic>? queryParameters,
    bool isIsolate = true,
    bool includeAuthorization = true,
  }) => _request(
    (dio) => dio.get(url, queryParameters: queryParameters),
    converter: converter,
    isIsolate: isIsolate,
    includeAuthorization: includeAuthorization,
  );

  Future<Either<Failure, T>> postRequest<T>(
    String url, {
    required ResponseConverter<T> converter,
    Map<String, dynamic>? data,
    bool isIsolate = true,
    bool includeAuthorization = true,
  }) => _request(
    (dio) => dio.post(url, data: data),
    converter: converter,
    isIsolate: isIsolate,
    includeAuthorization: includeAuthorization,
  );

  Future<Either<Failure, T>> _request<T>(
    Future<Response<dynamic>> Function(Dio dio) send, {
    required ResponseConverter<T> converter,
    required bool isIsolate,
    required bool includeAuthorization,
  }) async {
    try {
      final requestDio = dio;
      if (!includeAuthorization) {
        requestDio.options.headers.remove('Authorization');
      }
      final response = await send(requestDio);
      final statusCode = response.statusCode ?? 0;
      if (statusCode < 200 || statusCode > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final result = await IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      ).parseInBackground();
      return Right(result);
    } on DioException catch (e, stackTrace) {
      if (!_isUnitTest) {
        nonFatalError(error: e, stackTrace: stackTrace); // coverage:ignore-line
      }
      return Left(ServerFailure(errorMessage(e)));
    }
  }

  /// Primary API puts the message in `diagnostic.message`; other backends
  /// (DummyJSON) use a top-level `message`.
  static String? errorMessage(DioException e) {
    final data = e.response?.data;
    if (data is Map) {
      final diagnostic = data['diagnostic'];
      final message = diagnostic is Map
          ? diagnostic['message']
          : data['message'];
      if (message is String && message.isNotEmpty) {
        return message;
      }
    }
    return e.message;
  }
}
