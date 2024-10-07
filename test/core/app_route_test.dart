import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../helpers/fake_path_provider_platform.dart';
import '../helpers/test_mock.mocks.dart';

class MockMainCubit extends MockCubit<MainState> implements MainCubit {}

class FakeMainCubit extends Fake implements MainCubit {}

class MockUserCubit extends MockCubit<UserState> implements UserCubit {}

class FakeUserCubit extends Fake implements UserCubit {}

class MockLogoutCubit extends MockCubit<LogoutState> implements LogoutCubit {}

class FakeLogoutCubit extends Fake implements LogoutCubit {}

void main() {
  late MainCubit mainCubit;
  late UserCubit userCubit;
  late LogoutCubit logoutCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeMainCubit());
    registerFallbackValue(FakeUserCubit());
    registerFallbackValue(FakeLogoutCubit());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'app_route_test_');

    mainCubit = MockMainCubit();
    userCubit = MockUserCubit();
    logoutCubit = MockLogoutCubit();
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
    AppRoute.setStream(context, isTest: true);
    when(() => mainCubit.state).thenReturn(
      MainState.success(
        DataHelper(
          title: Strings.of(context)?.settings ?? "Settings",
        ),
      ),
    );
    when(() => mainCubit.initMenu(context)).thenAnswer((_) async {});

    when(() => userCubit.state).thenReturn(const UserState.success(null));
    when(() => userCubit.getUser()).thenAnswer((_) async {});

    when(() => logoutCubit.state).thenReturn(const LogoutState.loading());

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
