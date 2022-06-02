import 'dart:convert';
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

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

class MockUsersCubit extends MockCubit<UsersState> implements UsersCubit {}

class FakeUserState extends Fake implements UsersState {}

void main() {
  late UsersCubit usersCubit;
  late Users users;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeUserState());
    registerFallbackValue(UsersParams());
  });

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    usersCubit = MockUsersCubit();
    users = UsersResponse.fromJson(json.decode(jsonReader(successUserPath)))
        .toEntity();
  });

  Widget _rootWidget(Widget body) {
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
          locale: Locale(sl<PrefManager>().locale),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders DashboardPage for UsersStatus.loading',
    (tester) async {
      when(() => usersCubit.state).thenReturn(const UsersState());
      await tester.pumpWidget(_rootWidget(const DashboardPage()));
      expect(find.byType(Loading), findsOneWidget);
    },
  );

  testWidgets(
    'renders DashboardPage for UsersStatus.empty',
    (tester) async {
      when(() => usersCubit.state)
          .thenReturn(const UsersState(status: UsersStatus.empty));
      await tester.pumpWidget(_rootWidget(const DashboardPage()));
      expect(find.byType(Empty), findsOneWidget);
    },
  );

  testWidgets(
    'renders DashboardPage for UsersStatus.failure',
    (tester) async {
      when(() => usersCubit.state)
          .thenReturn(const UsersState(status: UsersStatus.failure));
      await tester.pumpWidget(_rootWidget(const DashboardPage()));
      expect(find.byType(Empty), findsOneWidget);
    },
  );

  testWidgets(
    'renders DashboardPage for UsersStatus.success',
    (tester) async {
      when(() => usersCubit.state).thenReturn(
        UsersState(
          status: UsersStatus.success,
          users: users,
        ),
      );
      await tester.pumpWidget(_rootWidget(const DashboardPage()));
      expect(find.byType(ListView), findsOneWidget);
    },
  );

  testWidgets(
    'trigger refresh when pull to refresh',
    (tester) async {
      when(() => usersCubit.state).thenReturn(
        UsersState(
          status: UsersStatus.success,
          users: users,
        ),
      );
      when(() => usersCubit.refreshUsers(any())).thenAnswer((_) async {});

      await tester.pumpWidget(_rootWidget(const DashboardPage()));

      await tester.fling(
        find.text('Michael Lawson'),
        const Offset(0.0, 500.0),
        1000.0,
      );

      /// Do loops to waiting refresh indicator showing
      /// instead using tester.pumpAndSettle it's will result time out error
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(milliseconds: 100));
      }
      verify(() => usersCubit.refreshUsers(any())).called(1);
    },
  );
}
