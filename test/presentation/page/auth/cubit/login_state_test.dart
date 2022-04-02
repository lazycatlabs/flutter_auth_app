import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginStatusX', () {
    test('returns correct values for LoginStatus.loading', () {
      const status = LoginStatus.loading;
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for LoginStatus.success', () {
      const status = LoginStatus.success;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for LoginStatus.failure', () {
      const status = LoginStatus.failure;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
    });
  });
}
