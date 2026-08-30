import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/utils/utils.dart';

// coverage:ignore-start
class DioInterceptor extends Interceptor
    with FirebaseCrashLogger, MainBoxMixin {
  static const _skipRefreshKey = 'skipAuthRefresh';
  static Future<bool>? _activeRefresh;

  final Dio Function() _dioFactory;
  final Future<void> Function()? _onLogout;
  final String Function() _deviceInfo;

  DioInterceptor({
    Dio Function()? dioFactory,
    Future<void> Function()? onLogout,
    String Function()? deviceInfo,
  }) : _dioFactory = dioFactory ?? (() => DioClient().dio),
       _onLogout = onLogout,
       _deviceInfo = deviceInfo ?? (() => Platform.localHostname);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String headerMessage = '';
    options.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    try {
      options.queryParameters.forEach((k, v) => debugPrint('► $k: $v'));
    } catch (_) {}
    try {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      final String prettyJson = encoder.convert(options.data);
      log.d(
        // ignore: unnecessary_null_comparison
        "REQUEST ► ︎ ${options.method != null ? options.method.toUpperCase() : 'METHOD'} ${"${options.baseUrl}${options.path}"}\n\n"
        'Headers:\n'
        '$headerMessage\n'
        '❖ QueryParameters : \n'
        'Body: $prettyJson',
      );
    } catch (e, stackTrace) {
      log.e('Failed to extract json request $e');
      nonFatalError(error: e, stackTrace: stackTrace);
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException dioException,
    ErrorInterceptorHandler handler,
  ) async {
    log.e(
      "<-- ${dioException.message} ${dioException.response?.requestOptions != null ? (dioException.response!.requestOptions.baseUrl + dioException.response!.requestOptions.path) : 'URL'}\n\n"
      "${dioException.response != null ? dioException.response!.data : 'Unknown Error'}",
    );

    nonFatalError(error: dioException, stackTrace: dioException.stackTrace);
    if (dioException.response?.statusCode == 401) {
      final retryResponse = await _refreshAndRetry(dioException.requestOptions);
      if (retryResponse != null) {
        return handler.resolve(retryResponse);
      }
    }
    return handler.next(dioException);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final authToken = _storedString(MainBoxKeys.authToken);
    final headers = Map<String, dynamic>.from(requestOptions.headers)
      ..removeWhere((key, _) => key.toLowerCase() == 'authorization');
    if (authToken != null) {
      headers['Authorization'] = authToken;
    }

    final options = Options(
      method: requestOptions.method,
      headers: headers,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      followRedirects: requestOptions.followRedirects,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      extra: {...requestOptions.extra, _skipRefreshKey: true},
    );

    final dio = _dioFactory()..options.baseUrl = requestOptions.baseUrl;
    return dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
      cancelToken: requestOptions.cancelToken,
    );
  }

  Future<bool> refreshToken() async {
    final refreshToken = _storedString(MainBoxKeys.refreshToken);
    final generalToken = _storedString(MainBoxKeys.generalToken);
    if (refreshToken == null || generalToken == null) {
      return false;
    }

    try {
      final response = await _dioFactory().post<dynamic>(
        ListAPI.refreshToken,
        data: {
          'refreshToken': refreshToken,
          'deviceInfo': _deviceInfo(),
          'fcmToken': _storedString(MainBoxKeys.fcm) ?? 'GeneratedFCMToken',
          'loginType': 'email',
        },
        options: Options(
          headers: {'Authorization': generalToken},
          extra: const {_skipRefreshKey: true},
        ),
      );

      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201 ||
          response.data is! Map<String, dynamic>) {
        return false;
      }

      final data = LoginResponse.fromJson(
        response.data as Map<String, dynamic>,
      ).data;
      if (data?.token == null ||
          data?.refreshToken == null ||
          data?.tokenType == null) {
        return false;
      }

      await addData(
        MainBoxKeys.refreshToken,
        '${data!.tokenType} ${data.refreshToken}',
      );
      await addData(MainBoxKeys.authToken, '${data.tokenType} ${data.token}');
      return true;
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return false;
    }
  }

  Future<Response<dynamic>?> _refreshAndRetry(
    RequestOptions requestOptions,
  ) async {
    if (!_canRefresh(requestOptions)) {
      return null;
    }

    final didRefresh = await _refreshOnce();
    if (!didRefresh) {
      await _logout();
      return null;
    }

    try {
      return await _retry(requestOptions);
    } catch (error, stackTrace) {
      nonFatalError(error: error, stackTrace: stackTrace);
      return null;
    }
  }

  bool _canRefresh(RequestOptions requestOptions) {
    if (requestOptions.extra[_skipRefreshKey] == true ||
        requestOptions.path.startsWith('/api/auth/')) {
      return false;
    }
    final authorization = requestOptions.headers.entries
        .where((entry) => entry.key.toLowerCase() == 'authorization')
        .firstOrNull
        ?.value
        .toString();
    final generalToken = _storedString(MainBoxKeys.generalToken);
    return authorization != null &&
        authorization != generalToken &&
        (_storedString(MainBoxKeys.refreshToken)?.isNotEmpty ?? false);
  }

  Future<bool> _refreshOnce() async {
    final activeRefresh = _activeRefresh;
    if (activeRefresh != null) {
      return activeRefresh;
    }

    final refresh = refreshToken();
    _activeRefresh = refresh;
    try {
      return await refresh;
    } finally {
      if (identical(_activeRefresh, refresh)) {
        _activeRefresh = null;
      }
    }
  }

  String? _storedString(MainBoxKeys key) {
    try {
      return getData<String?>(key);
    } catch (_) {
      return null;
    }
  }

  Future<void> _logout() => _onLogout?.call() ?? logoutBox();

  Future<void> _handleUnauthorizedResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    final retryResponse = await _refreshAndRetry(response.requestOptions);
    if (retryResponse != null) {
      handler.resolve(retryResponse);
      return;
    }
    handler.next(response);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String headerMessage = '';
    response.headers.forEach((k, v) => headerMessage += '► $k: $v\n');

    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String prettyJson = encoder.convert(response.data);
    log.d(
      // ignore: unnecessary_null_comparison
      "◀ ︎RESPONSE ${response.statusCode} ${response.requestOptions != null ? (response.requestOptions.baseUrl + response.requestOptions.path) : 'URL'}\n\n"
      'Headers:\n'
      '$headerMessage\n'
      '❖ Results : \n'
      'Response: $prettyJson',
    );
    if (response.statusCode == 401) {
      _handleUnauthorizedResponse(response, handler);
      return;
    }
    super.onResponse(response, handler);
  }
}

// coverage:ignore-end
