import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:flutter_auth_app/utils/services/hive/hive.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../helpers/fake_path_provider_platform.dart';
import '../helpers/test_mock.mocks.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'app_route_test_');
  });

  test('Routes enum contains correct paths', () {
    expect(Routes.root.path, equals('/'));
    expect(Routes.splashScreen.path, equals('/splashscreen'));
    expect(Routes.dashboard.path, equals('/dashboard'));
    expect(Routes.settings.path, equals('/settings'));
    expect(Routes.login.path, equals('/auth/login'));
    expect(Routes.register.path, equals('/auth/register'));
  });

  test("Check AppRoute setStream", () {
    final context = MockBuildContext();
    AppRoute.setStream(context, isTest: true);
    expect(AppRoute.context, equals(context));
    expect(AppRoute.isUnitTest, equals(true));
  });

  test("Check AppRoute router", () {
    expect(AppRoute.router, isA<GoRouter>());
  });

  test("Check initial route is splashscreen", () {
    final context = MockBuildContext();
    AppRoute.setStream(context, isTest: true);
    expect(
      AppRoute.router.routeInformationProvider.value.uri.path,
      equals(Routes.splashScreen.path),
    );
  });

  testWidgets('Dashboard route builds within shell correctly',
      (WidgetTester tester) async {
    final context = MockBuildContext();
    //set login as true
    MainBoxMixin.mainBox?.put(MainBoxKeys.isLogin.name, true);

    AppRoute.setStream(context, isTest: true);
    // Create a test app with the router
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp.router(
          routerConfig: AppRoute.router,
          localizationsDelegates: const [
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: const Locale("en"),
          supportedLocales: L10n.all,
          theme: themeLight(context),
        ),
      ),
    );

    // Navigate to dashboard
    await tester.pumpAndSettle();

    expect(find.byType(MainPage), findsOneWidget);
    expect(find.byType(DashboardPage), findsOneWidget);
  });
}
