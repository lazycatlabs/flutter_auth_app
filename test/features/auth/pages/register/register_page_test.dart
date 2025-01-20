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

class MockReloadFormCubit extends MockCubit<ReloadFormState>
    implements ReloadFormCubit {}

class FakeReloadFormState extends Fake implements ReloadFormState {}

void main() {
  late RegisterCubit registerCubit;
  late ReloadFormCubit reloadFormCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeRegisterState());
    registerFallbackValue(FakeReloadFormState());
    registerFallbackValue(const RegisterParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true);
    registerCubit = MockRegisterCubit();
    reloadFormCubit = MockReloadFormCubit();
  });

  Widget rootWidget(Widget body, {bool isDarkTheme = false}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>.value(value: registerCubit),
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
          theme: isDarkTheme
              ? themeDark(MockBuildContext())
              : themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders RegisterPage for in Light and Dark Theme',
    (tester) async {
      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const RegisterPage()));
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
        rootWidget(const RegisterPage(), isDarkTheme: true),
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
    'renders RegisterPage for form validation blank',
    (tester) async {
      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.formUpdated());
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 500));

      await tester.dragUntilVisible(
        find.byKey(const Key('name')),
        find.byType(SingleChildScrollView),
        const Offset(0, 50),
      );

      /// validate name
      await tester.tap(find.byKey(const Key('name')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 500));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Can't be empty"), findsOneWidget);

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('email')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsOneWidget);

      /// validate password
      await tester.tap(find.byKey(const Key('password')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );

      /// validate repeat password
      await tester.tap(find.byKey(const Key('repeat_password')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password doesn't match"), findsOneWidget);

      /// the button should be disable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isNull,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill name',
    (tester) async {
      const name = "Mudassir";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));

      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const RegisterPage()));

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );

      /// validate name
      await tester.enterText(find.byKey(const Key('name')), name);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Can't be empty"), findsNothing);

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), name);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsOneWidget);

      /// validate password
      await tester.tap(find.byKey(const Key('password')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );

      /// validate repeat password
      await tester.tap(find.byKey(const Key('repeat_password')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password doesn't match"), findsOneWidget);

      /// the button should be disable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isNull,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill name, email',
    (tester) async {
      const name = "Mudassir";
      const email = "mudassir@lazycatlabs.com";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));

      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const RegisterPage()));

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );

      /// validate name
      await tester.enterText(find.byKey(const Key('name')), name);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Can't be empty"), findsNothing);

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsNothing);

      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsNothing);

      /// validate password
      await tester.tap(find.byKey(const Key('password')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(
        find.text("Password must be at least 6 characters"),
        findsOneWidget,
      );

      /// validate repeat password
      await tester.tap(find.byKey(const Key('repeat_password')));
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password doesn't match"), findsOneWidget);

      /// the button should be disable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isNull,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation - fill name, email, password',
    (tester) async {
      const name = "Mudassir";
      const email = "mudassir@lazycatlabs.com";
      const password = "pass123";

      // Mock state providers
      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      // Build the widget
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      await tester.pumpAndSettle();

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );

      /// validate name
      await tester.enterText(find.byKey(const Key('name')), name);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Can't be empty"), findsNothing);

      // Enter email and check validation
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsNothing);

      // Enter password and check validation
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password must be at least 6 characters"), findsNothing);

      // Simulate an invalid repeat password and check validation
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password doesn't match"), findsNothing);

      /// the button should be disable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isNull,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password (not match)',
    (tester) async {
      const name = "Mudassir";
      const email = "mudassir@lazycatlabs.com";
      const password = "pass123";

      when(() => registerCubit.state)
          .thenReturn(const RegisterState.success(null));
      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const RegisterPage()));

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );

      /// validate name
      await tester.enterText(find.byKey(const Key('name')), name);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Can't be empty"), findsNothing);

      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsNothing);

      /// validate password
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password must be at least 6 characters"), findsNothing);

      /// validate repeat password
      await tester.enterText(find.byKey(const Key('repeat_password')), '');
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password doesn't match"), findsOneWidget);

      /// the button should be disable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isNull,
      );
    },
  );

  testWidgets(
    'renders RegisterPage for form validation fill email,' +
        'password, repeat password (match) and call register cubit',
    (tester) async {
      const name = "Mudassir";
      const email = "mudassir@lazycatlabs.com";
      const password = "pass123";

      when(() => registerCubit.state).thenReturn(const RegisterState.loading());
      when(() => registerCubit.register(any())).thenAnswer((_) async {});

      when(() => reloadFormCubit.state)
          .thenReturn(const ReloadFormState.initial());

      await tester.pumpWidget(rootWidget(const RegisterPage()));

      await tester.drag(
        find.byType(SingleChildScrollView),
        const Offset(0, -500),
      );

      /// validate name
      await tester.enterText(find.byKey(const Key('name')), name);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Can't be empty"), findsNothing);

      /// validate email
      await tester.enterText(find.byKey(const Key('email')), email);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Email is not valid"), findsNothing);

      /// validate password
      await tester.enterText(find.byKey(const Key('password')), password);
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password must be at least 6 characters"), findsNothing);

      /// validate repeat password
      await tester.enterText(
        find.byKey(const Key('repeat_password')),
        password,
      );
      await tester.pumpAndSettle();
      await tester.pump(const Duration(milliseconds: 450));
      await tester.pumpWidget(rootWidget(const RegisterPage()));
      expect(find.text("Password doesn't match"), findsNothing);

      await tester.pumpAndSettle();
      await tester.dragUntilVisible(
        find.byKey(const Key('btn_register')), // what you want to find
        find.byType(SingleChildScrollView), // widget you want to scroll
        const Offset(0, 50), // delta to move
      );

      /// validate email
      await tester.tap(find.byKey(const Key('btn_register')));

      /// the button should be enable
      expect(
        tester.widget<Button>(find.byType(Button)).onPressed,
        isA<VoidCallback>(),
      );

      /// verify register cubit is called
      verify(() => registerCubit.register(any())).called(1);
    },
  );
}
