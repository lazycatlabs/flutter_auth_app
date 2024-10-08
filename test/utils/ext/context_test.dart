import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/ext/context.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_mock.mocks.dart';

void main() {
  Widget rootWidget(Widget body) {
    return ScreenUtilInit(
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
    );
  }

  testWidgets('widthInPercent returns correct width',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      rootWidget(
        Builder(
          builder: (context) {
            final width = context.widthInPercent(50);
            expect(width, equals(MediaQuery.of(context).size.width * 0.5));
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('heightInPercent returns correct height',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      rootWidget(
        Builder(
          builder: (context) {
            final height = context.heightInPercent(50);
            expect(height, equals(MediaQuery.of(context).size.height * 0.5));
            return Container();
          },
        ),
      ),
    );
  });

  testWidgets('show displays loading dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
      rootWidget(
        Builder(
          builder: (context) {
            Future.delayed(const Duration(milliseconds: 400), () {
              context.show();
            });
            return Container();
          },
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PopScope), findsOneWidget);
    expect(find.byType(Material), findsOneWidget);
  });

  testWidgets('dismiss closes loading dialog', (WidgetTester tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      rootWidget(
        Builder(
          builder: (ctx) {
            context = ctx;
            Future.delayed(const Duration(milliseconds: 400), () {
              ctx.show();
            });
            return Container();
          },
        ),
      ),
    );

    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(PopScope), findsOneWidget);
    expect(find.byType(Material), findsOneWidget);

    // Dismiss the dialog
    context.dismiss();
    await tester.pump(); // Complete the dialog closing animation

    expect(find.byType(PopScope), findsNothing);
    expect(find.byType(Material), findsNothing);
  });
}
