import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

/// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';

/// ignore: depend_on_referenced_packages
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
            dataMenu: const [],
            currentIndex: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      expect(find.byType(CircleImage), findsOneWidget);
    });

    testWidgets('displays menu items', (WidgetTester tester) async {
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      when(() => userCubit.getUser()).thenAnswer((_) async {});

      const dataMenu = [
        DataHelper(title: 'Dashboard'),
        DataHelper(title: 'Settings'),
        DataHelper(title: 'Logout'),
      ];

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            dataMenu: dataMenu,
            currentIndex: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      for (final item in dataMenu) {
        expect(find.text(item.title!), findsOneWidget);
      }
    });

    testWidgets('displays loading header', (WidgetTester tester) async {
      when(() => userCubit.state).thenReturn(const UserState.loading());

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            dataMenu: const [],
            currentIndex: (_) {},
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
            dataMenu: const [],
            currentIndex: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );

      expect(find.text('Failed'), findsOneWidget);
    });

    testWidgets('updates selected menu index when menu is tapped', (
      WidgetTester tester,
    ) async {
      int? selectedIndex;
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      const dataMenu = [DataHelper(title: 'Logout')];

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            dataMenu: dataMenu,
            currentIndex: (index) => selectedIndex = index,
            onLogoutPressed: () {},
          ),
        ),
      );

      await tester.tap(find.text('Logout'));
      await tester.pump();

      expect(selectedIndex, 0);
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
            dataMenu: const [DataHelper(title: 'Logout')],
            currentIndex: (_) {},
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
            dataMenu: const [
              DataHelper(
                title: 'Dashboard',
                icon: Icons.space_dashboard_outlined,
                isSelected: true,
              ),
            ],
            currentIndex: (_) {},
            onLogoutPressed: () {},
          ),
        ),
      );
      await tester.pump(const Duration(seconds: 1));

      expect(find.byIcon(Icons.verified_rounded), findsOneWidget);
      expect(find.byIcon(Icons.space_dashboard_outlined), findsOneWidget);
    });
  });
}
