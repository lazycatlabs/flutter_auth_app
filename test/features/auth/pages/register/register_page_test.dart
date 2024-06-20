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

class MockRegisterCubit extends MockCubit<RegisterState>
    implements RegisterCubit {}

class FakeRegisterState extends Fake implements RegisterState {}

void main() {
  late RegisterCubit registerCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeRegisterState());
    registerFallbackValue(const RegisterParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true);
    registerCubit = MockRegisterCubit();
  });

  Widget rootWidget(Widget body) {
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
          locale: const Locale("en"),
          theme: themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders RegisterPage for form validation blank',
    (tester) async {
      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsOneWidget);
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email',
    (tester) async {
      const email = "test@gmail.com";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));

      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,password',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();
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
      expect(find.text("Password must be at least 6 characters"), findsNothing);
      expect(find.text("Password doesn't match"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password (not match)',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.enterText(find.byKey(const Key('repeat_password')), '');

      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Password must be at least 6 characters"), findsNothing);
      expect(find.text("Password doesn't match"), findsOneWidget);
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password ( match) and call register cubit',
    (tester) async {
      const email = "test@gmail.com";
      const password = "password";

      when(() => registerCubit.state).thenReturn(const RegisterState.loading());
      when(() => registerCubit.register(any())).thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.pumpAndSettle();
      await tester.enterText(
        find.byKey(const Key('repeat_password')),
        password,
      );
      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text("Email is not valid"), findsNothing);
      expect(find.text("Password must be at least 6 characters"), findsNothing);
      expect(find.text("Password doesn't match"), findsNothing);

      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      verify(() => registerCubit.register(any())).called(1);
    },
  );
}
