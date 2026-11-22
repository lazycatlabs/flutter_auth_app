import 'package:dio/dio.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DioException error(Object? data) {
    final options = RequestOptions(path: '/');
    return DioException(
      requestOptions: options,
      response: Response(requestOptions: options, data: data),
      message: 'dio message',
    );
  }

  test('reads the primary API diagnostic message', () {
    expect(
      DioClient.errorMessage(
        error({
          'diagnostic': {
            'status': '404 Not Found',
            'message': 'User does not exist.',
          },
        }),
      ),
      'User does not exist.',
    );
  });

  test('falls back to a top-level message (DummyJSON)', () {
    expect(
      DioClient.errorMessage(error({'message': 'Invalid skip'})),
      'Invalid skip',
    );
  });

  test('falls back to the Dio message for non-JSON bodies', () {
    expect(DioClient.errorMessage(error('<html>')), 'dio message');
  });
}
