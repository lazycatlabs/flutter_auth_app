import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/general/general.dart';
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

  Widget rootWidget(Widget body) {
    return BlocProvider.value(
      value: userCubit,
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

      final dataMenu = [
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

    testWidgets('calls onLogoutPressed when logout is tapped',
        (WidgetTester tester) async {
      bool logoutCalled = false;
      when(() => userCubit.state).thenReturn(const UserState.success(null));

      when(() => userCubit.getUser()).thenAnswer((_) async {});

      await tester.pumpWidget(
        rootWidget(
          MenuDrawer(
            dataMenu: [DataHelper(title: 'Logout')],
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
  });
}
