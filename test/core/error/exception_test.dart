import 'package:flutter_auth_app/core/error/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Exceptions', () {
    test('ServerException should store message', () {
      const errorMessage = 'Server error occurred';
      final exception = ServerException(errorMessage);

      expect(exception.message, equals(errorMessage));
    });

    test('CacheException should be instantiable', () {
      final exception = CacheException();

      expect(exception, isA<CacheException>());
    });
  });
}
