import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

/// ignore: depend_on_referenced_packages
import 'package:mocktail/mocktail.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/test_mock.mocks.dart';

class MockSettingsCubit extends MockCubit<DataHelper>
    implements SettingsCubit {}

void main() {
  late SettingsCubit settingsCubit;

  setUpAll(() {
    HttpOverrides.global = null;
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'settings_page_test_');
    settingsCubit = MockSettingsCubit();
  });

  Widget rootWidget(Widget body) {
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
          locale: const Locale("en"),
          theme: themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'trigger update theme when dropdown theme tapped ',
    (tester) async {
      when(() => settingsCubit.state).thenReturn(DataHelper());

      await tester.pumpWidget(rootWidget(const SettingsPage()));
      await tester.pumpAndSettle();
      final dropdown = find.byKey(const Key("dropdown_theme")).last;

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      /// Tap  the first Item
      final dropdownItem = find.text('Theme Dark').last;

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();

      verify(() => settingsCubit.updateTheme(ActiveTheme.dark)).called(1);
    },
  );

  testWidgets(
    'trigger update language when dropdown language tapped in English',
    (tester) async {
      when(() => settingsCubit.state).thenReturn(DataHelper());

      await tester.pumpWidget(rootWidget(const SettingsPage()));
      await tester.pumpAndSettle();
      final dropdown = find.byKey(const Key("dropdown_language")).last;

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      /// Tap  the first Item
      final dropdownItem = find.text('English').last;

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();

      verify(() => settingsCubit.updateLanguage("en")).called(1);
    },
  );

  testWidgets(
    'trigger update language when dropdown language tapped in Bahasa ',
    (tester) async {
      when(() => settingsCubit.state).thenReturn(DataHelper());

      MainBoxMixin().addData(MainBoxKeys.locale, "id");
      await tester.pumpWidget(rootWidget(const SettingsPage()));
      await tester.pumpAndSettle();
      final dropdown = find.byKey(const Key("dropdown_language")).last;

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      /// Tap  the first Item
      final dropdownItem = find.text('Bahasa').last;

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();

      verify(() => settingsCubit.updateLanguage("id")).called(1);
    },
  );
}
