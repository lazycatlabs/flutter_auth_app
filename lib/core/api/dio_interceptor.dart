import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/utils/utils.dart';

// coverage:ignore-start
class DioInterceptor extends Interceptor
    with FirebaseCrashLogger, MainBoxMixin {
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
    if (dioException.response?.statusCode == 401 &&
        dioException.response?.data['meta']['description'] ==
            'Unauthenticated.') {
      if (getData(MainBoxKeys.refreshToken) != null) {
        await refreshToken();

        // Retry the request with the new token
        return handler.resolve(await _retry(dioException.requestOptions));
      } else {
        logoutBox();
      }
    }
    return handler.next(dioException);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return DioClient().dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<void> refreshToken() async {
    /// Call API Refresh token
    final response = await DioClient().postRequest(
      ListAPI.generalToken,
      data: {
        'clientId': const String.fromEnvironment('USER_CLIENT_ID'),
        'clientSecret': const String.fromEnvironment('USER_CLIENT_SECRET'),
        'grantType': 'refresh_token',
        'refreshToken': getData(MainBoxKeys.refreshToken),
      },
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );

    response.fold((l) => logoutBox(), (r) {
      final data = r.data;
      addData(
        MainBoxKeys.refreshToken,
        '${data?.tokenType} ${data?.refreshToken}',
      );
      addData(MainBoxKeys.authToken, '${data?.tokenType} ${data?.token}');
    });
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
    super.onResponse(response, handler);
  }
}

// coverage:ignore-end
