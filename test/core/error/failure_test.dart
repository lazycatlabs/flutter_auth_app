import 'package:flutter_auth_app/core/error/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Failure', () {
    test('ServerFailure equality and hashCode', () {
      const failure1 = ServerFailure('Error message');
      const failure2 = ServerFailure('Error message');
      const failure3 = ServerFailure('Different message');

      expect(failure1, equals(failure2));
      expect(failure1, isNot(equals(failure3)));
      expect(failure1.hashCode, equals(failure2.hashCode));
      expect(failure1.hashCode, isNot(equals(failure3.hashCode)));
    });

    test('NoDataFailure equality and hashCode', () {
      final failure1 = NoDataFailure();
      final failure2 = NoDataFailure();

      expect(failure1, equals(failure2));
      expect(failure1.hashCode, equals(failure2.hashCode));
    });

    test('CacheFailure equality and hashCode', () {
      final failure1 = CacheFailure();
      final failure2 = CacheFailure();

      expect(failure1, equals(failure2));
      expect(failure1.hashCode, equals(failure2.hashCode));
    });
  });
}
