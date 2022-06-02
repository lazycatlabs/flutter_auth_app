import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

class FakeLoginState extends Fake implements LoginState {}

void main() {
  late LoginCubit loginCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeLoginState());
    registerFallbackValue(LoginParams());
  });

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    loginCubit = MockLoginCubit();
  });

  Widget _rootWidget(Widget body) {
    return BlocProvider<LoginCubit>.value(
      value: loginCubit,
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
          locale: Locale(sl<PrefManager>().locale),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders LoginPage for form validation blank',
    (tester) async {
      when(() => loginCubit.state)
          .thenReturn(const LoginState(status: LoginStatus.success));
      await tester.pumpWidget(_rootWidget(const LoginPage()));
      await tester.dragUntilVisible(
        find.byType(Button), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byType(Button));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsOneWidget);
      expect(find.text("Can't be empty"), findsOneWidget);
    },
  );

  testWidgets(
    'renders LoginPage for form validation fill email',
    (tester) async {
      const email = "test@gmail.com";

      when(() => loginCubit.state)
          .thenReturn(const LoginState(status: LoginStatus.success));

      await tester.pumpWidget(_rootWidget(const LoginPage()));
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
      expect(find.text("Can't be empty"), findsOneWidget);
    },
  );

  testWidgets(
    'renders LoginPage for form validation fill email,password and call login cubit',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => loginCubit.state)
          .thenReturn(const LoginState(status: LoginStatus.success));
      when(() => loginCubit.login(any())).thenAnswer((_) async {});

      await tester.pumpWidget(_rootWidget(const LoginPage()));
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
      expect(find.text("Can't be empty"), findsNothing);

      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      verify(() => loginCubit.login(any())).called(1);
    },
  );
}
