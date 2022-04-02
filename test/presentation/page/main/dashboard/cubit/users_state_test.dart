import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersStatusX', () {
    test('returns correct values for UsersStatus.loading', () {
      const status = UsersStatus.loading;
      expect(status.isLoading, isTrue);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isEmpty, isFalse);
    });

    test('returns correct values for UsersStatus.success', () {
      const status = UsersStatus.success;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isTrue);
      expect(status.isFailure, isFalse);
      expect(status.isEmpty, isFalse);
    });

    test('returns correct values for UsersStatus.failure', () {
      const status = UsersStatus.failure;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isTrue);
      expect(status.isEmpty, isFalse);
    });
    test('returns correct values for UsersStatus.empty', () {
      const status = UsersStatus.empty;
      expect(status.isLoading, isFalse);
      expect(status.isSuccess, isFalse);
      expect(status.isFailure, isFalse);
      expect(status.isEmpty, isTrue);
    });
  });
}
