import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

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
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: L10n.all,
      theme: themeLight(MockBuildContext()),
      home: body,
    ),
  );

  testWidgets('displays circle image', (WidgetTester tester) async {
    await tester.pumpWidget(
      rootWidget(
        const CircleImage(url: 'https://example.com/image.jpg', size: 50),
      ),
    );

    expect(find.byType(CircleImage), findsOneWidget);
  });

  testWidgets('builds fallback icon when the image fails to load', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      rootWidget(
        const CircleImage(url: 'https://example.com/missing.jpg', size: 50),
      ),
    );

    final image = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );
    final context = tester.element(find.byType(CachedNetworkImage));
    final fallback = image.errorWidget!(context, image.imageUrl, Exception());
    final coloredBox = fallback as ColoredBox;
    final icon = coloredBox.child! as Icon;

    expect(coloredBox.color, Theme.of(context).colorScheme.tertiary);
    expect(icon.icon, Icons.person);
    expect(icon.size, Dimens.space36);
  });
}
