import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/test_mock.mocks.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class FakeAuthCubit extends Fake implements AuthCubit {}

class FakeReloadFormCubit extends Fake implements ReloadFormCubit {}

class MockReloadFormCubit extends MockCubit<ReloadFormState>
    implements ReloadFormCubit {}

void main() {
  late AuthCubit authCubit;
  late ReloadFormCubit reloadFormCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeAuthCubit());
    registerFallbackValue(FakeReloadFormCubit());
    registerFallbackValue(const LoginParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'login_page_test_');
    authCubit = MockAuthCubit();
    reloadFormCubit = MockReloadFormCubit();
  });

  Widget rootWidget(Widget body, {bool isDarkTheme = false}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>.value(value: authCubit),
        BlocProvider<ReloadFormCubit>.value(value: reloadFormCubit),
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
          theme: isDarkTheme
              ? themeDark(MockBuildContext())
              : themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders LoginPage for in Light and Dark Theme',
    (tester) async {
      when(() => authCubit.state).thenReturn(const AuthState.success(null));
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.pumpAndSettle();
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is Image) {
            return widget.image == AssetImage(Images.icLauncher);
          }
          return false;
        }),
        findsOneWidget,
      );

      /// change theme to dark
      await tester.pumpWidget(
        rootWidget(const LoginPage(), isDarkTheme: true),
      );
      await tester
          .pumpAndSettle(); // Verify that the dark theme image is displayed
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is Image) {
            return widget.image == AssetImage(Images.icLauncherDark);
          }
          return false;
        }),
        findsOneWidget,
      );

      /// the button should be disable
      expect(tester.widget<Button>(find.byType(Button)).onPressed, null);
    },
  );
  testWidgets(
    'renders LoginPage for form validation blank',
    (tester) async {
      when(() => authCubit.state).thenReturn(const AuthState.success(null));
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(Button), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// the button should be disable
      expect(tester.widget<Button>(find.byType(Button)).onPressed, null);
    },
  );

  testWidgets(
    'renders LoginPage for form validation fill email',
    (tester) async {
      const email = "mudassir@lazycatlabs.com";

      when(() => authCubit.state).thenReturn(const AuthState.success(null));
      when(() => authCubit.login(any())).thenAnswer((_) async {});
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byType(Button), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const LoginPage()));
      expect(find.text("Email is not valid"), findsNothing);

      await tester.tap(find.byKey(const Key('password')));
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const LoginPage()));
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );

      /// the button should be disable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        null,
      );
    },
  );

  testWidgets(
    'renders LoginPage for form validation fill email,password and call login cubit',
    (tester) async {
      const email = "mudassir@lazycatlabs.com";
      const password = "password";

      when(() => authCubit.state).thenReturn(const AuthState.success(null));
      when(() => authCubit.login(any())).thenAnswer((_) async {});
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.pumpAndSettle();

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const LoginPage()));
      expect(find.text("Email is not valid"), findsNothing);

      /// validate password
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const LoginPage()));
      expect(find.text("Password must be at least 6 characters"), findsNothing);

      /// the button should be enable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isA<VoidCallback>(),
      );

      // scroll down to make button visible
      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -250),
      );

      await tester.pump(const Duration(milliseconds: 450));
      await tester.tap(find.byType(Button));

      /// verify if authCubit.login is called
      verify(() => authCubit.login(any())).called(1);
    },
  );
}
