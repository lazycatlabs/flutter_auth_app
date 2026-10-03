import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart' hide DioInterceptor;
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../helpers/fake_path_provider_platform.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  const oldAuthToken = 'Bearer old-auth-token';
  const oldRefreshToken = 'Bearer old-refresh-token';
  const generalToken = 'Bearer general-token';
  const newAuthToken = 'Bearer new-auth-token';
  const newRefreshToken = 'Bearer new-refresh-token';
  const refreshResponse = {
    'diagnostic': {'status': '200 OK', 'message': 'Success'},
    'data': {
      'token': 'new-auth-token',
      'refreshToken': 'new-refresh-token',
      'tokenType': 'Bearer',
    },
  };
  const refreshPayload = {
    'refreshToken': oldRefreshToken,
    'deviceInfo': 'test-device',
    'fcmToken': 'test-fcm-token',
    'loginType': 'email',
  };

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'dio_interceptor_test_');
    await MainBoxMixin.mainBox?.clear();
    await MainBoxMixin.mainBox?.put(MainBoxKeys.authToken.name, oldAuthToken);
    await MainBoxMixin.mainBox?.put(
      MainBoxKeys.refreshToken.name,
      oldRefreshToken,
    );
    await MainBoxMixin.mainBox?.put(
      MainBoxKeys.generalToken.name,
      generalToken,
    );
    await MainBoxMixin.mainBox?.put(MainBoxKeys.fcm.name, 'test-fcm-token');
    await MainBoxMixin.mainBox?.put(MainBoxKeys.isLogin.name, true);

    dio = Dio(
      BaseOptions(
        baseUrl: 'https://lazyauth.lazycatlabs.com',
        headers: {'Authorization': oldAuthToken},
        validateStatus: (status) => status != null && status > 0,
      ),
    );
    dioAdapter = DioAdapter(dio: dio);
  });

  DioInterceptor buildInterceptor({Future<void> Function()? onLogout}) =>
      DioInterceptor(
        dioFactory: () => dio,
        deviceInfo: () => 'test-device',
        onLogout: onLogout,
      );

  test(
    'refresh token uses the LazyAuth contract and stores new tokens',
    () async {
      dioAdapter.onPost(
        ListAPI.refreshToken,
        (server) => server.replyCallback(200, (request) {
          expect(request.headers['Authorization'], generalToken);
          return refreshResponse;
        }),
        data: refreshPayload,
      );

      final didRefresh = await buildInterceptor().refreshToken();

      expect(didRefresh, isTrue);
      expect(
        MainBoxMixin.mainBox?.get(MainBoxKeys.authToken.name),
        newAuthToken,
      );
      expect(
        MainBoxMixin.mainBox?.get(MainBoxKeys.refreshToken.name),
        newRefreshToken,
      );
    },
  );

  test('401 response refreshes and retries with the new auth token', () async {
    var protectedRequestCount = 0;
    dioAdapter.onGet(
      '/protected',
      (server) => server.replyCallback(200, (request) {
        protectedRequestCount++;
        return {'result': 'retried'};
      }),
      headers: const {'Authorization': newAuthToken},
    );
    dioAdapter.onGet(
      '/protected',
      (server) => server.replyCallback(401, (request) {
        protectedRequestCount++;
        return const {
          'diagnostic': {
            'status': '401 Unauthorized',
            'message': 'Token expired',
          },
        };
      }),
      headers: const {'Authorization': oldAuthToken},
    );
    dioAdapter.onPost(
      ListAPI.refreshToken,
      (server) => server.reply(200, refreshResponse),
      data: refreshPayload,
    );
    dio.interceptors.add(buildInterceptor());

    final response = await dio.get<dynamic>('/protected');

    expect(response.statusCode, 200);
    expect(response.data, {'result': 'retried'});
    expect(protectedRequestCount, 2);
  });

  test(
    'failed refresh clears the user session without retrying forever',
    () async {
      var logoutCount = 0;
      dioAdapter.onGet(
        '/protected',
        (server) => server.reply(401, const {
          'diagnostic': {
            'status': '401 Unauthorized',
            'message': 'Token expired',
          },
        }),
      );
      dioAdapter.onPost(
        ListAPI.refreshToken,
        (server) => server.reply(401, const {
          'diagnostic': {
            'status': '401 Unauthorized',
            'message': 'Refresh token expired',
          },
        }),
        data: refreshPayload,
      );
      dio.interceptors.add(
        buildInterceptor(
          onLogout: () async {
            logoutCount++;
            await MainBoxMixin().logoutBox();
          },
        ),
      );

      final response = await dio.get<dynamic>('/protected');

      expect(response.statusCode, 401);
      expect(logoutCount, 1);
      expect(MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name), isNull);
      expect(MainBoxMixin.mainBox?.get(MainBoxKeys.authToken.name), isNull);
      expect(MainBoxMixin.mainBox?.get(MainBoxKeys.refreshToken.name), isNull);
    },
  );

  test(
    '401 without an auth header does not trigger LazyAuth refresh',
    () async {
      var refreshCount = 0;
      dio.options.headers.remove('Authorization');
      dioAdapter.onGet(
        'https://dummyjson.com/protected',
        (server) => server.reply(401, const {'message': 'Unauthorized'}),
      );
      dioAdapter.onPost(
        ListAPI.refreshToken,
        (server) => server.replyCallback(200, (_) {
          refreshCount++;
          return refreshResponse;
        }),
        data: refreshPayload,
      );
      dio.interceptors.add(buildInterceptor());

      final response = await dio.get<dynamic>(
        'https://dummyjson.com/protected',
      );

      expect(response.statusCode, 401);
      expect(refreshCount, 0);
    },
  );

  test('overlapping 401 responses share one refresh and both retry', () async {
    var protectedRequestCount = 0;
    dioAdapter.onGet(
      '/protected',
      (server) => server.replyCallback(200, (request) {
        protectedRequestCount++;
        return {'result': 'retried'};
      }),
      headers: const {'Authorization': newAuthToken},
    );
    dioAdapter.onGet(
      '/protected',
      (server) => server.replyCallback(401, (request) {
        protectedRequestCount++;
        return const {
          'diagnostic': {
            'status': '401 Unauthorized',
            'message': 'Token expired',
          },
        };
      }),
      headers: const {'Authorization': oldAuthToken},
    );
    final interceptor = _ControlledRefreshInterceptor(dioFactory: () => dio);
    dio.interceptors.add(interceptor);

    final responses = Future.wait([
      dio.get<dynamic>('/protected'),
      dio.get<dynamic>('/protected'),
    ]);

    // Both requests are parked on the shared refresh before it resolves.
    await interceptor.bothUnauthorized.future;
    expect(interceptor.refreshCount, 1);

    await MainBoxMixin.mainBox?.put(MainBoxKeys.authToken.name, newAuthToken);
    interceptor.pendingRefresh.complete(true);

    final results = await responses;

    expect(interceptor.refreshCount, 1);
    expect(results.map((response) => response.statusCode), [200, 200]);
    expect(results.map((response) => response.data), [
      {'result': 'retried'},
      {'result': 'retried'},
    ]);
    expect(protectedRequestCount, 4);
  });
}

/// Holds the refresh open until the test releases it, so overlapping 401s
/// are guaranteed to meet on the shared in-flight refresh.
class _ControlledRefreshInterceptor extends DioInterceptor {
  _ControlledRefreshInterceptor({super.dioFactory});

  final pendingRefresh = Completer<bool>();
  final bothUnauthorized = Completer<void>();
  int refreshCount = 0;
  var _unauthorizedCount = 0;

  @override
  Future<bool> refreshToken() {
    refreshCount++;
    return pendingRefresh.future;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // super runs synchronously up to the await on the shared refresh.
    super.onResponse(response, handler);
    if (response.statusCode == 401 && ++_unauthorizedCount == 2) {
      bothUnauthorized.complete();
    }
  }
}
