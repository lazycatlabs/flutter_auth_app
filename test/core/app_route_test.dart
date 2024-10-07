import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {});

  test('Routes enum contains correct paths', () {
    expect(Routes.root.path, equals('/'));
    expect(Routes.splashScreen.path, equals('/splashscreen'));
    expect(Routes.dashboard.path, equals('/dashboard'));
    expect(Routes.settings.path, equals('/settings'));
    expect(Routes.login.path, equals('/auth/login'));
    expect(Routes.register.path, equals('/auth/register'));
  });
}
