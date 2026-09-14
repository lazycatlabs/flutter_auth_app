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
      home: Scaffold(body: body),
    ),
  );

  testWidgets('renders description and handles submitted action', (
    tester,
  ) async {
    await tester.pumpWidget(
      rootWidget(
        const TextF(
          key: Key('field'),
          label: 'Email',
          description: 'Use your work email.',
          textInputAction: TextInputAction.next,
        ),
      ),
    );

    expect(find.text('Use your work email.'), findsOneWidget);

    await tester.tap(find.byType(TextFormField));
    await tester.testTextInput.receiveAction(TextInputAction.next);
    await tester.pump();

    expect(find.byType(TextFormField), findsOneWidget);
  });
}
