import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  Widget rootWidget(Widget body) => ScreenUtilInit(
    designSize: const Size(375, 667),
    builder: (_, _) => MaterialApp(
      home: Scaffold(body: Center(child: body)),
    ),
  );

  double scale(WidgetTester tester) =>
      tester.widget<AnimatedScale>(find.byType(AnimatedScale)).scale;

  testWidgets('scales down while pressed and back on release', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      rootWidget(Button(title: 'Login', onPressed: () => tapped = true)),
    );

    final gesture = await tester.startGesture(
      tester.getCenter(find.byType(Button)),
    );
    await tester.pump();
    expect(scale(tester), lessThan(1));

    await gesture.up();
    await tester.pumpAndSettle();
    expect(scale(tester), 1);
    expect(tapped, isTrue);
  });

  testWidgets('restores scale when the press is cancelled', (tester) async {
    await tester.pumpWidget(
      rootWidget(Button(title: 'Login', onPressed: () {})),
    );

    final gesture = await tester.startGesture(
      tester.getCenter(find.byType(Button)),
    );
    await tester.pump();
    expect(scale(tester), lessThan(1));

    await gesture.cancel();
    await tester.pumpAndSettle();
    expect(scale(tester), 1);
  });

  testWidgets('does not scale when disabled', (tester) async {
    await tester.pumpWidget(
      rootWidget(const Button(title: 'Login', onPressed: null)),
    );

    final gesture = await tester.startGesture(
      tester.getCenter(find.byType(Button)),
    );
    await tester.pump();
    expect(scale(tester), 1);

    await gesture.up();
  });
}
