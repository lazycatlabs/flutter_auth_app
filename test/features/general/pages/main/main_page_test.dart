import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

/// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/test_mock.mocks.dart';

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
    await serviceLocator(isUnitTest: true, prefixBox: "main_page_test_");
    mainCubit = MockMainCubit();
    userCubit = MockUserCubit();
    logoutCubit = MockLogoutCubit();
  });

  Widget rootWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: mainCubit),
        BlocProvider.value(value: userCubit),
        BlocProvider.value(value: logoutCubit),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, __) => MaterialApp(
          localizationsDelegates: const [
            Strings.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: const Locale("en"),
          supportedLocales: L10n.all,
          theme: themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets('MainPage displays correctly', (WidgetTester tester) async {
    when(() => mainCubit.state).thenReturn(
      MainState.success(
        DataHelper(
          title: Strings.of(MockBuildContext())?.settings ?? "Settings",
        ),
      ),
    );
    when(() => mainCubit.initMenu(MockBuildContext())).thenAnswer((_) async {});

    when(() => userCubit.state).thenReturn(const UserState.success(null));
    when(() => userCubit.getUser()).thenAnswer((_) async {});

    when(() => logoutCubit.state).thenReturn(const LogoutState.loading());

    await tester.pumpWidget(
      rootWidget(
        const MainPage(child: SettingsPage()),
      ),
    );

    verifyNever(() => mainCubit.initMenu(MockBuildContext()));
    verifyNever(() => userCubit.getUser()).called(0);

    expect(find.text("Settings"), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.byType(SettingsPage), findsOneWidget);
  });
}
