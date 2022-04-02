import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterStatusX', () {
    test('returns correct values for RegisterStatus.loading', () {
      const status = RegisterStatus.loading;
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for RegisterStatus.success', () {
      const status = RegisterStatus.success;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
    });

    test('returns correct values for RegisterStatus.failure', () {
      const status = RegisterStatus.failure;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
    });
  });
}
