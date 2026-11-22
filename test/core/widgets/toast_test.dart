import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:toastification/toastification.dart';

import '../../helpers/test_mock.mocks.dart';

void main() {
  Widget rootWidget(Widget body) => ScreenUtilInit(
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

  testWidgets('toToastSuccess shows a Toast and auto-dismisses it', (
    tester,
  ) async {
    await tester.pumpWidget(
      ToastificationWrapper(
        child: rootWidget(
          Builder(
            builder: (context) => TextButton(
              onPressed: () =>
                  'Saved'.toToastSuccess(context, isUnitTest: true),
              child: const Text('show'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('show'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    /// toastification renders inside a shrink-wrapped sliver list, which the
    /// test finder treats as offstage, so look past that.
    Finder toast() => find.byType(Toast, skipOffstage: false);
    expect(
      find.descendant(
        of: toast(),
        matching: find.text('Saved', skipOffstage: false),
      ),
      findsOneWidget,
    );

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
    expect(toast(), findsNothing);
    toastification.dismissAll(delayForAnimation: false);
  });
}
