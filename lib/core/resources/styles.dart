import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';

/// Light theme
ThemeData themeLight(BuildContext context) => ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      primaryColor: Palette.primary,
      disabledColor: Palette.divider,
      hintColor: Palette.hint,
      cardColor: Palette.white,
      scaffoldBackgroundColor: Palette.background,
      colorScheme: const ColorScheme.light().copyWith(
        primary: Palette.primary,
        background: Palette.background,
      ),
      textTheme: TextTheme(
        displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: Dimens.displayLarge,
              color: Palette.text,
            ),
        displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: Dimens.displayMedium,
              color: Palette.text,
            ),
        displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: Dimens.displaySmall,
              color: Palette.text,
            ),
        headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: Dimens.headlineMedium,
              color: Palette.text,
            ),
        headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: Dimens.headlineSmall,
              color: Palette.text,
            ),
        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: Dimens.titleLarge,
              color: Palette.text,
            ),
        titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: Dimens.titleMedium,
              color: Palette.text,
            ),
        titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: Dimens.titleSmall,
              color: Palette.text,
            ),
        bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.bodyLarge,
              color: Palette.text,
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: Dimens.bodyMedium,
              color: Palette.text,
            ),
        bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: Dimens.bodySmall,
              color: Palette.text,
            ),
        labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: Dimens.labelLarge,
              color: Palette.text,
            ),
        labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: Dimens.labelSmall,
              letterSpacing: 0.25,
              color: Palette.text,
            ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        color: Palette.white,
        iconTheme: const IconThemeData(color: Palette.primary),
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
        surfaceTintColor: Palette.white,
        shadowColor: Palette.divider,
      ),
      drawerTheme: const DrawerThemeData().copyWith(
        elevation: 0,
        surfaceTintColor: Palette.white,
        backgroundColor: Palette.white,
      ),
      brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Palette.primary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

/// Dark theme
ThemeData themeDark(BuildContext context) => ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      primaryColor: Palette.primary,
      disabledColor: Palette.divider,
      hintColor: Palette.white.withOpacity(0.75),
      cardColor: Palette.primary.withOpacity(0.75),
      scaffoldBackgroundColor: Palette.backgroundDark,
      colorScheme: const ColorScheme.dark().copyWith(primary: Palette.primary),
      textTheme: TextTheme(
        displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontSize: Dimens.displayLarge,
              color: Palette.white,
            ),
        displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: Dimens.displayMedium,
              color: Palette.white,
            ),
        displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: Dimens.displaySmall,
              color: Palette.white,
            ),
        headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: Dimens.headlineMedium,
              color: Palette.white,
            ),
        headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontSize: Dimens.headlineSmall,
              color: Palette.white,
            ),
        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: Dimens.titleLarge,
              color: Palette.white,
            ),
        titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: Dimens.titleMedium,
              color: Palette.white,
            ),
        titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: Dimens.titleSmall,
              color: Palette.white,
            ),
        bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: Dimens.bodyLarge,
              color: Palette.white,
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: Dimens.bodyMedium,
              color: Palette.white,
            ),
        bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: Dimens.bodySmall,
              color: Palette.white,
            ),
        labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: Dimens.labelLarge,
              color: Palette.white,
            ),
        labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: Dimens.labelSmall,
              letterSpacing: 0.25,
              color: Palette.white,
            ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        iconTheme: const IconThemeData(color: Palette.white),
        color: Palette.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        surfaceTintColor: Palette.primary,
        shadowColor: Palette.divider,
      ),
      drawerTheme: const DrawerThemeData().copyWith(
        elevation: 0,
        surfaceTintColor: Palette.backgroundDark,
        backgroundColor: Palette.backgroundDark,
        shadowColor: Palette.divider,
      ),
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: Palette.primary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

class BoxDecorations {
  BoxDecorations._();

  static BoxDecoration button = const BoxDecoration(
    color: Palette.primary,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.button],
  );

  static BoxDecoration card = const BoxDecoration(
    color: Palette.white,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.card],
  );

  static BoxDecoration dialogAlt = const BoxDecoration(
    color: Palette.white,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows.dialogAlt],
  );

  static BoxDecoration bottomSheet = const BoxDecoration(
    color: Palette.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(Dimens.cornerRadiusBottomSheet),
      topRight: Radius.circular(Dimens.cornerRadiusBottomSheet),
    ),
    boxShadow: [BoxShadows.dialog],
  );

  static BoxDecoration buttonMenu = const BoxDecoration(
    color: Palette.white,
    borderRadius: BorderRadius.all(
      Radius.circular(Dimens.cornerRadius),
    ),
    boxShadow: [BoxShadows.buttonMenu],
  );
}

class BoxShadows {
  BoxShadows._();

  static const BoxShadow button = BoxShadow(
    color: Palette.black20,
    blurRadius: 16.0,
    spreadRadius: 1.0,
  );

  static const BoxShadow card = BoxShadow(
    color: Palette.black15,
    blurRadius: 12.0,
    spreadRadius: 1.0,
  );

  static const BoxShadow dialog = BoxShadow(
    color: Palette.black10,
    offset: Offset(0, -4),
    blurRadius: 16.0,
  );

  static const BoxShadow dialogAlt = BoxShadow(
    color: Palette.black25,
    offset: Offset(0, 4),
    blurRadius: 16.0,
  );

  static const BoxShadow buttonMenu = BoxShadow(
    color: Palette.black25,
    blurRadius: 4.0,
  );
}
