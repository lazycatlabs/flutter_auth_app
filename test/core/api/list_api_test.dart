import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListAPI', () {
    test('Auth endpoints', () {
      expect(ListAPI.generalToken, equals('/v1/api/auth/general'));
      expect(ListAPI.user, equals('/v1/api/user'));
      expect(ListAPI.login, equals('/v1/api/auth/login'));
      expect(ListAPI.logout, equals('/v1/api/auth/logout'));
    });

    test('User endpoints', () {
      expect(ListAPI.users, equals('/v1/api/user/all'));
    });
  });
}
