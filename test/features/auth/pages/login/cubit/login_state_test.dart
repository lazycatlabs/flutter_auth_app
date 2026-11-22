import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthStatusX', () {
    test('returns correct values for AuthStatus.loading', () {
      const status = LoginState.loading();
      expect(status, const LoginState.loading());
    });

    test('returns correct values for AuthStatus.success', () {
      const status = LoginState.success(null);
      expect(status, const LoginState.success(null));
    });

    test('returns correct values for AuthStatus.failure', () {
      const status = LoginState.failure('');
      expect(status, const LoginState.failure(''));
    });
  });
}
