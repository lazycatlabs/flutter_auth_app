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

class MockRegisterCubit extends MockCubit<RegisterState>
    implements RegisterCubit {}

class FakeRegisterState extends Fake implements RegisterState {}

void main() {
  late RegisterCubit registerCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeRegisterState());
    registerFallbackValue(RegisterParams());
  });

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    registerCubit = MockRegisterCubit();
  });

  Widget _rootWidget(Widget body) {
    return BlocProvider<RegisterCubit>.value(
      value: registerCubit,
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
    'renders RegisterPage for form validation blank',
    (tester) async {
      when(() => registerCubit.state)
          .thenReturn(const RegisterState(status: RegisterStatus.success));
      await tester.pumpWidget(_rootWidget(const RegisterPage()));
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsOneWidget);
      expect(find.text("Can't be empty"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email',
    (tester) async {
      const email = "test@gmail.com";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState(status: RegisterStatus.success));

      await tester.pumpWidget(_rootWidget(const RegisterPage()));
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Can't be empty"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,password',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState(status: RegisterStatus.success));
      await tester.pumpWidget(_rootWidget(const RegisterPage()));
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Can't be empty"), findsNothing);
      expect(find.text("Password not match"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password (not match)',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState(status: RegisterStatus.success));
      await tester.pumpWidget(_rootWidget(const RegisterPage()));
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.enterText(find.byKey(const Key('repeat_password')), '');

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Can't be empty"), findsNothing);
      expect(find.text("Password not match"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password ( match) and call register cubit',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state).thenReturn(const RegisterState());
      when(() => registerCubit.register(any())).thenAnswer((_) async {});

      await tester.pumpWidget(_rootWidget(const RegisterPage()));
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.enterText(
        find.byKey(const Key('repeat_password')),
        password,
      );

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Can't be empty"), findsNothing);
      expect(find.text("Password not match"), findsNothing);

      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      verify(() => registerCubit.register(any())).called(1);
    },
  );
}
