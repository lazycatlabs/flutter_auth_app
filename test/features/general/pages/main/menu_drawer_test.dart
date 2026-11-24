import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'package:mocktail/mocktail.dart';

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/test_mock.mocks.dart';

class MockUserCubit extends MockCubit<UserState> implements UserCubit {}

class FakeUserCubit extends Fake implements UserCubit {}

void main() {
  late UserCubit userCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeUserCubit());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, isHiveEnable: false);
    userCubit = MockUserCubit();
  });

  Widget rootWidget(Widget body) => BlocProvider.value(
    value: userCubit,
    child: ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => MaterialApp(
        localizationsDelegates: const [
          Strings.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        locale: const Locale('en'),
        supportedLocales: L10n.all,
        theme: themeLight(MockBuildContext()),
        home: body,
      ),
    ),
  );

  group('MenuDrawer', () {
    testWidgets('displays user information', (WidgetTester tester) async {
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      when(() => userCubit.getUser()).thenAnswer((_) async {});

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      expect(find.byType(CircleImage), findsOneWidget);
    });

    testWidgets('displays menu items', (WidgetTester tester) async {
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      when(() => userCubit.getUser()).thenAnswer((_) async {});

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      for (final title in ['Dashboard', 'Settings', 'Logout']) {
        expect(find.text(title), findsOneWidget);
      }
    });

    testWidgets('displays loading header', (WidgetTester tester) async {
      when(() => userCubit.state).thenReturn(const UserState.loading());

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      expect(
        find.byWidgetPredicate((widget) => widget is Skeletonizer),
        findsOneWidget,
      );
    });

    testWidgets('displays failure header message', (WidgetTester tester) async {
      when(() => userCubit.state).thenReturn(const UserState.failure('Failed'));

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      expect(find.text('Failed'), findsOneWidget);
    });

    testWidgets('reports the tapped menu', (WidgetTester tester) async {
      MainMenu? selectedMenu;
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (menu) => selectedMenu = menu,
            onLogoutPressed: () {},
          ),
        ),
      );

      await tester.tap(find.text('Logout'));
      await tester.pump();

      expect(selectedMenu, MainMenu.logout);
    });

    testWidgets('calls onLogoutPressed when logout is tapped', (
      WidgetTester tester,
    ) async {
      bool logoutCalled = false;
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      when(() => userCubit.getUser()).thenAnswer((_) async {});

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (_) {},
            onLogoutPressed: () {
              logoutCalled = true;
            },
          ),
        ),
      );

      await tester.tap(find.text('Logout'));
      await tester.pump();

      expect(logoutCalled, isTrue);
    });

    testWidgets('shows the verified badge and menu icons', (tester) async {
      when(() => userCubit.state).thenReturn(
        const UserState.success(
          User(name: 'Mudassir', email: 'mudassir@mail.com', isVerified: true),
        ),
      );

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(find.byIcon(Icons.verified_rounded), findsOneWidget);
      expect(find.byIcon(Icons.space_dashboard_outlined), findsOneWidget);
    });
  });

  testWidgets('navigates to the tapped menu route', (tester) async {
    MainMenu? selected;
    when(() => userCubit.state).thenReturn(const UserState.success(null));
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => MenuDrawer(
            selected: MainMenu.dashboard,
            onSelected: (menu) => selected = menu,
            onLogoutPressed: () {},
          ),
        ),
        GoRoute(
          path: Routes.settings.path,
          name: Routes.settings.name,
          builder: (_, _) => const Text('settings route'),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      BlocProvider.value(
        value: userCubit,
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          builder: (_, _) => MaterialApp.router(
            routerConfig: router,
            localizationsDelegates: const [
              Strings.delegate,
              ...GlobalMaterialLocalizations.delegates,
            ],
            locale: const Locale('en'),
            supportedLocales: L10n.all,
            theme: themeLight(MockBuildContext()),
          ),
        ),
      ),
    );

    /// The avatar placeholder shimmers forever, so pump a fixed time
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Settings'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(selected, MainMenu.settings);
    expect(find.text('settings route'), findsOneWidget);
  });
}
