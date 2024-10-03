import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersStatusX', () {
    test('returns correct values for UsersStatus.loading', () {
      const status = UsersState.loading();
      expect(status, const UsersState.loading());
    });

    test('returns correct values for UsersStatus.success', () {
      const status = UsersState.success(Users());
      expect(status, const UsersState.success(Users()));
    });

    test('returns correct values for UsersStatus.failure', () {
      const status = UsersState.failure("");
      expect(status, const UsersState.failure(""));
    });
    test('returns correct values for UsersStatus.empty', () {
      const status = UsersState.empty();
      expect(status, const UsersState.empty());
    });
  });
}
