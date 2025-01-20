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

class MockGeneralTokenCubit extends MockCubit<GeneralTokenState>
    implements GeneralTokenCubit {}

class FakeGeneralTokenCubit extends Fake implements GeneralTokenCubit {}

void main() {
  late GeneralTokenCubit generalTokenCubit;

  setUpAll(() {
    HttpOverrides.global = null;
    registerFallbackValue(FakeGeneralTokenCubit());
    registerFallbackValue(const GeneralTokenParams());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, isHiveEnable: false);
    generalTokenCubit = MockGeneralTokenCubit();
  });

  Widget rootWidget(Widget body, {bool isDarkTheme = false}) {
    return BlocProvider<GeneralTokenCubit>.value(
      value: generalTokenCubit,
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
          theme: isDarkTheme
              ? themeDark(MockBuildContext())
              : themeLight(MockBuildContext()),
          home: body,
        ),
      ),
    );
  }

  testWidgets(
    'renders SplashScreenPage in Light and DarkTheme',
    (tester) async {
      when(() => generalTokenCubit.state)
          .thenReturn(const GeneralTokenState.success(null));
      when(() => generalTokenCubit.generalToken(any()))
          .thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(SplashScreenPage()));
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
        rootWidget(SplashScreenPage(), isDarkTheme: true),
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
    },
  );

  testWidgets(
    'renders SplashScreenPage and validate if general token is called',
    (tester) async {
      when(() => generalTokenCubit.state)
          .thenReturn(const GeneralTokenState.success(null));
      when(() => generalTokenCubit.generalToken(any()))
          .thenAnswer((_) async {});

      await tester.pumpWidget(rootWidget(SplashScreenPage()));
      await tester.pumpAndSettle();

      expect(find.byType(Parent), findsNWidgets(1));
      expect(find.byType(ColoredBox), findsNWidgets(1));
      expect(find.byType(Center), findsNWidgets(1));
      expect(find.byType(Image), findsNWidgets(1));

      await tester.pumpAndSettle();
    },
  );
}
