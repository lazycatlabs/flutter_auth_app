import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthStatusX', () {
    test('returns correct values for AuthStatus.loading', () {
      const status = AuthStatus.loading;
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for AuthStatus.success', () {
      const status = AuthStatus.success;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for AuthStatus.failure', () {
      const status = AuthStatus.failure;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
    });
  });
}
