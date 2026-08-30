import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ListAPI', () {
    test('Auth endpoints', () {
      expect(ListAPI.generalToken, equals('/api/auth/general'));
      expect(ListAPI.refreshToken, equals('/api/auth/refresh'));
      expect(ListAPI.user, equals('/api/user'));
      expect(ListAPI.login, equals('/api/auth/login-email'));
      expect(ListAPI.logout, equals('/api/auth/logout'));
    });

    test('User endpoints', () {
      expect(ListAPI.users, equals('https://dummyjson.com/users'));
    });
  });
}
