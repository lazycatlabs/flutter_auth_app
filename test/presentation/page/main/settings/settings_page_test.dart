import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSettingsCubit extends MockCubit<int> implements SettingsCubit {}

void main() {
  late SettingsCubit settingsCubit;

  setUpAll(() {
    HttpOverrides.global = null;
  });

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    settingsCubit = MockSettingsCubit();
  });

  Widget _rootWidget(Widget body) {
    return BlocProvider<SettingsCubit>.value(
      value: settingsCubit,
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
    'trigger reload widget when dropdown theme tapped ',
    (tester) async {
      when(() => settingsCubit.state).thenReturn(1);

      await tester.pumpWidget(_rootWidget(const SettingsPage()));
      final dropdown = find.byKey(const Key("dropdown_theme")).last;

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      /// Tap  the first Item
      final dropdownItem = find.text('Theme Dark').last;

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();

      verify(() => settingsCubit.reloadWidget()).called(1);
    },
  );

  testWidgets(
    'trigger reload widget when dropdown language tapped ',
    (tester) async {
      when(() => settingsCubit.state).thenReturn(1);

      await tester.pumpWidget(_rootWidget(const SettingsPage()));
      final dropdown = find.byKey(const Key("dropdown_language")).last;

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      /// Tap  the first Item
      final dropdownItem = find.text('English').last;

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();

      verify(() => settingsCubit.reloadWidget()).called(1);
    },
  );
}
