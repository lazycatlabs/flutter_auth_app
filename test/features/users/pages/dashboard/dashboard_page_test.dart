import 'dart:convert';
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
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

class MockUsersCubit extends MockCubit<UsersState> implements UsersCubit {}

class FakeUsersState extends Fake implements UsersState {}

void main() {
  late UsersCubit usersCubit;
  late Users users;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeUsersState());
    registerFallbackValue(const UsersParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'dashboard_page_test_');
    usersCubit = MockUsersCubit();
    users = UsersResponse.fromJson(
      json.decode(jsonReader(pathUsersResponse200)) as Map<String, dynamic>,
    ).toEntity();
  });

  Widget rootWidget(Widget body) {
    return BlocProvider<UsersCubit>.value(
      value: usersCubit,
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
    'renders DashboardPage for UsersStatus.loading',
    (tester) async {
      when(() => usersCubit.state).thenReturn(const UsersState.loading());
      await tester.pumpWidget(rootWidget(const DashboardPage()));
      await tester.pump();
      expect(find.byType(Loading), findsOneWidget);
    },
  );

  testWidgets(
    'renders DashboardPage for UsersStatus.empty',
    (tester) async {
      when(() => usersCubit.state).thenReturn(const UsersState.empty());
      await tester.pumpWidget(rootWidget(const DashboardPage()));
      await tester.pump();
      expect(find.byType(Empty), findsOneWidget);
    },
  );

  testWidgets(
    'renders DashboardPage for UsersStatus.failure',
    (tester) async {
      when(() => usersCubit.state).thenReturn(const UsersState.failure(""));
      await tester.pumpWidget(rootWidget(const DashboardPage()));
      await tester.pump();
      expect(find.byType(Empty), findsOneWidget);
    },
  );

  testWidgets(
    'renders DashboardPage for UsersStatus.success',
    (tester) async {
      when(() => usersCubit.state).thenReturn(
        UsersState.success(users),
      );
      when(() => usersCubit.fetchUsers(any())).thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(const DashboardPage()));

      /// Do loops to waiting refresh indicator showing
      /// instead using tester.pumpAndSettle it's will result time out error
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      expect(find.byType(ListView), findsOneWidget);
    },
  );

  testWidgets(
    'trigger refresh when pull to refresh',
    (tester) async {
      when(() => usersCubit.state).thenReturn(
        UsersState.success(users),
      );
      when(() => usersCubit.refresh()).thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(const DashboardPage()));

      /// Do loops to waiting refresh indicator showing
      /// instead using tester.pumpAndSettle it's will result time out error
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      /// Simulate pull to refresh

      // Do loops to wait for the refresh indicator to show
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      await tester.fling(
        find.text('Mudassir'),
        const Offset(0.0, 500.0),
        1000.0,
      );

      /// Do loops to waiting refresh indicator showing
      /// instead using tester.pumpAndSettle it's will result time out error
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }

      // Verify that the refresh method was called
      verify(() => usersCubit.refresh()).called(1);
    },
  );
}
