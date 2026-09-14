import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import '../../helpers/test_mock.mocks.dart';

void main() {
  Widget rootWidget(Widget body) => ScreenUtilInit(
    designSize: const Size(375, 667),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_, _) => MaterialApp(
      localizationsDelegates: const [
        Strings.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: L10n.all,
      theme: themeLight(MockBuildContext()),
      home: body,
    ),
  );

  testWidgets('displays circle image', (WidgetTester tester) async {
    final message = StringBuffer('Message').toString();
    await tester.pumpWidget(
      rootWidget(
        Toast(
          bgColor: Colors.red,
          icon: Icons.error,
          message: message,
          textColor: Colors.white,
        ),
      ),
    );

    expect(find.byType(Toast), findsOneWidget);
    expect(find.byType(Icon), findsOneWidget);
    expect(find.text('Message'), findsOneWidget);
  });
}
