import 'package:material_ui/material_ui.dart';

/// Burgundy-led palette. Light mode sits on warm off-whites, dark mode on
/// deep wine-tinted neutrals so the primary never fights the background.
class Palette {
  Palette._();

  static const Color background = Color(0xffFBF8F8);
  static const Color backgroundDark = Color(0xff130D0F);
  static const Color surface = Color(0xffffffff);
  static const Color surfaceDark = Color(0xff1C1517);
  static const Color surfaceContainer = Color(0xffF5EFF0);
  static const Color surfaceContainerDark = Color(0xff241B1E);
  static const Color surfaceContainerHigh = Color(0xffEFE6E8);
  static const Color surfaceContainerHighDark = Color(0xff2D2326);
  static const Color onSurface = Color(0xff1E1416);
  static const Color onSurfaceDark = Color(0xffF5ECEE);
  static const Color surfaceVariant = Color(0xffF1E7E9);
  static const Color surfaceVariantDark = Color(0xff31262A);
  static const Color onSurfaceVariant = Color(0xff74656A);
  static const Color onSurfaceVariantDark = Color(0xffBDACB1);
  static const Color outline = Color(0xffE9DFE1);
  static const Color outlineDark = Color(0xff3A2E32);
  static const Color shadow = Color(0xff3B0A18);
  static const Color shadowDark = Color(0xff000000);

  static const Color primary = Color(0xff800020);
  static const Color onPrimary = surface;
  static const Color primaryDark = Color(0xffEBA5B6);
  static const Color onPrimaryDark = Color(0xff4A0014);
  static const Color primaryContainer = Color(0xffF7E4E8);
  static const Color onPrimaryContainer = Color(0xff5C0018);
  static const Color primaryContainerDark = Color(0xff4B1424);
  static const Color onPrimaryContainerDark = Color(0xffFFD9E1);

  static const Color secondary = Color(0xff8A6670);
  static const Color onSecondary = surface;
  static const Color secondaryDark = Color(0xffDDBDC6);
  static const Color onSecondaryDark = Color(0xff3F2830);
  static const Color secondaryContainer = Color(0xffF4E8EB);
  static const Color onSecondaryContainer = Color(0xff5E4049);
  static const Color secondaryContainerDark = Color(0xff3A2A30);
  static const Color onSecondaryContainerDark = secondaryDark;

  static const Color tertiary = Color(0xffA2742C);
  static const Color onTertiary = surface;
  static const Color tertiaryDark = Color(0xffE8C38A);
  static const Color onTertiaryDark = Color(0xff3F2A00);
  static const Color tertiaryContainer = Color(0xffF8EEDC);
  static const Color onTertiaryContainer = Color(0xff6B4A12);
  static const Color tertiaryContainerDark = Color(0xff3B2D14);
  static const Color onTertiaryContainerDark = tertiaryDark;

  static const Color error = Color(0xffB3261E);
  static const Color onError = surface;
  static const Color errorDark = Color(0xffFFB4AB);
  static const Color onErrorDark = Color(0xff690005);
  static const Color errorContainer = Color(0xffFCE4E2);
  static const Color onErrorContainer = error;
  static const Color errorContainerDark = Color(0xff5C2420);
  static const Color onErrorContainerDark = errorDark;

  static const Color warning = Color(0xff9A6700);
  static const Color warningDark = Color(0xffFFD36A);
  static const Color warningContainer = Color(0xffFFF3CD);
  static const Color onWarningContainer = Color(0xff7A4F01);
  static const Color warningContainerDark = Color(0xff3B2F12);
  static const Color onWarningContainerDark = warningDark;

  static const Color textPrimary = onSurface;
  static const Color textPrimaryDark = onSurfaceDark;
  static const Color textSecondary = onSurfaceVariant;
  static const Color textSecondaryDark = onSurfaceVariantDark;
  static const Color textOnPrimary = onPrimary;
  static const Color textOnPrimaryDark = onPrimaryDark;
  static const Color textOnSecondary = onSecondary;
  static const Color textOnSecondaryDark = onSecondaryDark;
  static const Color textOnTertiary = onTertiary;
  static const Color textOnTertiaryDark = onTertiaryDark;
  static const Color textOnError = onError;
  static const Color textOnErrorDark = onErrorDark;
  static const Color textLink = primary;
  static const Color textLinkDark = primaryDark;
  static const Color textError = error;
  static const Color textErrorDark = errorDark;
  static const Color textWarning = onWarningContainer;
  static const Color textWarningDark = warningDark;
}
