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
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/test_mock.mocks.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

class FakeAuthCubit extends Fake implements AuthCubit {}

void main() {
  late AuthCubit authCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeAuthCubit());
    registerFallbackValue(const LoginParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true);
    authCubit = MockAuthCubit();
  });

  Widget rootWidget(Widget body) {
    return BlocProvider<AuthCubit>.value(
      value: authCubit,
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
          theme: themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders LoginPage for form validation blank',
    (tester) async {
      when(() => authCubit.state).thenReturn(const AuthState.success(null));
      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.dragUntilVisible(
        find.byType(Button), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byType(Button));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsOneWidget);
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders LoginPage for form validation fill email',
    (tester) async {
      const email = "test@gmail.com";

      when(() => authCubit.state).thenReturn(const AuthState.success(null));

      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.dragUntilVisible(
        find.byType(Button), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byType(Button));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders LoginPage for form validation fill email,password and call login cubit',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => authCubit.state).thenReturn(const AuthState.success(null));
      when(() => authCubit.login(any())).thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(const LoginPage()));
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);

      await tester.dragUntilVisible(
        find.byType(Button), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byType(Button));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Password must be at least 6 characters"), findsNothing);

      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      verify(() => authCubit.login(any())).called(1);
    },
  );
}
