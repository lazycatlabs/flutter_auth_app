import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

const String _fontFamily = 'InstrumentSans';

/// Light theme
// ignore: avoid_unused_parameters
ThemeData themeLight(BuildContext context) => _buildTheme(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light().copyWith(
    primary: Palette.primary,
    onPrimary: Palette.onPrimary,
    primaryContainer: Palette.primaryContainer,
    onPrimaryContainer: Palette.onPrimaryContainer,
    secondary: Palette.secondary,
    onSecondary: Palette.onSecondary,
    secondaryContainer: Palette.secondaryContainer,
    onSecondaryContainer: Palette.onSecondaryContainer,
    tertiary: Palette.tertiary,
    onTertiary: Palette.onTertiary,
    tertiaryContainer: Palette.tertiaryContainer,
    onTertiaryContainer: Palette.onTertiaryContainer,
    error: Palette.error,
    onError: Palette.onError,
    errorContainer: Palette.errorContainer,
    onErrorContainer: Palette.onErrorContainer,
    surface: Palette.background,
    onSurface: Palette.onSurface,
    surfaceContainerLowest: Palette.surface,
    surfaceContainerLow: Palette.surface,
    surfaceContainer: Palette.surfaceContainer,
    surfaceContainerHigh: Palette.surfaceContainerHigh,
    surfaceContainerHighest: Palette.surfaceVariant,
    onSurfaceVariant: Palette.onSurfaceVariant,
    outline: Palette.outline,
    outlineVariant: Palette.outline,
    shadow: Palette.shadow,
  ),
  colors: const LzyctColors(
    background: Palette.background,
    surface: Palette.surface,
    surfaceVariant: Palette.surfaceVariant,
    onPrimary: Palette.onPrimary,
    onSurfaceVariant: Palette.onSurfaceVariant,
    textPrimary: Palette.textPrimary,
    textSecondary: Palette.textSecondary,
    textOnPrimary: Palette.textOnPrimary,
    textOnSecondary: Palette.textOnSecondary,
    textOnTertiary: Palette.textOnTertiary,
    textOnError: Palette.textOnError,
    textLink: Palette.textLink,
    textError: Palette.textError,
    textWarning: Palette.textWarning,
    shadow: Palette.shadow,
    warning: Palette.warning,
  ),
  cardColor: Palette.surface,
  overlayStyle: SystemUiOverlayStyle.dark,
);

/// Dark theme
// ignore: avoid_unused_parameters
ThemeData themeDark(BuildContext context) => _buildTheme(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark().copyWith(
    primary: Palette.primaryDark,
    onPrimary: Palette.onPrimaryDark,
    primaryContainer: Palette.primaryContainerDark,
    onPrimaryContainer: Palette.onPrimaryContainerDark,
    secondary: Palette.secondaryDark,
    onSecondary: Palette.onSecondaryDark,
    secondaryContainer: Palette.secondaryContainerDark,
    onSecondaryContainer: Palette.onSecondaryContainerDark,
    tertiary: Palette.tertiaryDark,
    onTertiary: Palette.onTertiaryDark,
    tertiaryContainer: Palette.tertiaryContainerDark,
    onTertiaryContainer: Palette.onTertiaryContainerDark,
    error: Palette.errorDark,
    onError: Palette.onErrorDark,
    errorContainer: Palette.errorContainerDark,
    onErrorContainer: Palette.onErrorContainerDark,
    surface: Palette.backgroundDark,
    onSurface: Palette.onSurfaceDark,
    surfaceContainerLowest: Palette.surfaceDark,
    surfaceContainerLow: Palette.surfaceDark,
    surfaceContainer: Palette.surfaceContainerDark,
    surfaceContainerHigh: Palette.surfaceContainerHighDark,
    surfaceContainerHighest: Palette.surfaceVariantDark,
    onSurfaceVariant: Palette.onSurfaceVariantDark,
    outline: Palette.outlineDark,
    outlineVariant: Palette.outlineDark,
    shadow: Palette.shadowDark,
  ),
  colors: const LzyctColors(
    background: Palette.backgroundDark,
    surface: Palette.surfaceDark,
    surfaceVariant: Palette.surfaceVariantDark,
    onPrimary: Palette.onPrimaryDark,
    onSurfaceVariant: Palette.onSurfaceVariantDark,
    textPrimary: Palette.textPrimaryDark,
    textSecondary: Palette.textSecondaryDark,
    textOnPrimary: Palette.textOnPrimaryDark,
    textOnSecondary: Palette.textOnSecondaryDark,
    textOnTertiary: Palette.textOnTertiaryDark,
    textOnError: Palette.textOnErrorDark,
    textLink: Palette.textLinkDark,
    textError: Palette.textErrorDark,
    textWarning: Palette.textWarningDark,
    shadow: Palette.shadowDark,
    warning: Palette.warningDark,
  ),
  cardColor: Palette.surfaceDark,
  overlayStyle: SystemUiOverlayStyle.light,
);

ThemeData _buildTheme({
  required Brightness brightness,
  required ColorScheme colorScheme,
  required LzyctColors colors,
  required Color cardColor,
  required SystemUiOverlayStyle overlayStyle,
}) {
  final textTheme = _textTheme(colorScheme.onSurface);
  const fieldRadius = BorderRadius.all(Radius.circular(Dimens.cornerRadius));
  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    fontFamily: _fontFamily,
    colorScheme: colorScheme,
    textTheme: textTheme,
    primaryColor: colorScheme.primary,
    disabledColor: colorScheme.outline,
    hintColor: colorScheme.onSurfaceVariant,
    cardColor: cardColor,
    dividerColor: colorScheme.outline,
    scaffoldBackgroundColor: colorScheme.surface,
    splashFactory: InkSparkle.splashFactory,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    iconTheme: IconThemeData(color: colorScheme.onSurface),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      surfaceTintColor: Colors.transparent,
      elevation: Dimens.zero,
      scrolledUnderElevation: Dimens.zero,
      centerTitle: true,
      titleTextStyle: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: colorScheme.onSurface),
      systemOverlayStyle: overlayStyle.copyWith(
        statusBarColor: Colors.transparent,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainer,
      isDense: true,
      hintStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused)
            ? colorScheme.primary
            : colorScheme.onSurfaceVariant,
      ),
      suffixIconColor: colorScheme.onSurfaceVariant,
      border: const OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide(color: colorScheme.surfaceContainer),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide(color: colorScheme.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: fieldRadius,
        borderSide: BorderSide(color: colorScheme.error, width: 1.5),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: colorScheme.primary,
        textStyle: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        shape: shape,
      ),
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: cardColor,
      surfaceTintColor: Colors.transparent,
      elevation: Dimens.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadiusLg)),
      ),
      titleTextStyle: textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      contentTextStyle: textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    ),
    drawerTheme: DrawerThemeData(
      elevation: Dimens.zero,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(Dimens.cornerRadiusLg),
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: cardColor,
      surfaceTintColor: Colors.transparent,
      elevation: Dimens.zero,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.primary,
      circularTrackColor: colorScheme.primaryContainer,
      strokeCap: StrokeCap.round,
    ),
    dividerTheme: DividerThemeData(
      color: colorScheme.outline,
      thickness: 1,
      space: 1,
    ),
    extensions: <ThemeExtension<dynamic>>[colors],
  );
}

/// Skeleton loading look, derived from the active theme so the shimmer
/// follows the in-app theme mode rather than the platform brightness.
SkeletonizerConfigData skeletonConfig(BuildContext context) {
  final colorScheme = ColorScheme.of(context);

  return SkeletonizerConfigData(
    brightness: Theme.brightnessOf(context),
    effectResolver: (_) => ShimmerEffect(
      baseColor: colorScheme.surfaceContainerHigh,
      highlightColor: colorScheme.surfaceContainerLowest,
      duration: const Duration(milliseconds: 1400),
    ),
    justifyMultiLineText: false,
    enableSwitchAnimation: true,
  );
}

TextTheme _textTheme(Color color) {
  TextStyle style(double size, FontWeight weight, {double spacing = 0}) =>
      TextStyle(
        fontFamily: _fontFamily,
        fontSize: size,
        fontWeight: weight,
        letterSpacing: spacing,
        color: color,
        height: 1.3,
      );

  return TextTheme(
    displayLarge: style(Dimens.displayLarge, FontWeight.w600, spacing: -1.5),
    displayMedium: style(Dimens.displayMedium, FontWeight.w600, spacing: -1),
    displaySmall: style(Dimens.displaySmall, FontWeight.w600, spacing: -0.8),
    headlineLarge: style(Dimens.headlineLarge, FontWeight.w600, spacing: -0.6),
    headlineMedium: style(
      Dimens.headlineMedium,
      FontWeight.w600,
      spacing: -0.6,
    ),
    headlineSmall: style(Dimens.headlineSmall, FontWeight.w600, spacing: -0.4),
    titleLarge: style(Dimens.titleLarge, FontWeight.w600, spacing: -0.2),
    titleMedium: style(Dimens.titleMedium, FontWeight.w500, spacing: -0.1),
    titleSmall: style(Dimens.titleSmall, FontWeight.w500),
    bodyLarge: style(Dimens.bodyLarge, FontWeight.w400),
    bodyMedium: style(Dimens.bodyMedium, FontWeight.w400),
    bodySmall: style(Dimens.bodySmall, FontWeight.w400),
    labelLarge: style(Dimens.labelLarge, FontWeight.w500),
    labelMedium: style(Dimens.labelMedium, FontWeight.w500, spacing: 0.1),
    labelSmall: style(Dimens.labelSmall, FontWeight.w500, spacing: 0.25),
  );
}

class LzyctColors extends ThemeExtension<LzyctColors> {
  final Color? background;
  final Color? surface;
  final Color? surfaceVariant;
  final Color? onPrimary;
  final Color? onSurfaceVariant;
  final Color? textPrimary;
  final Color? textSecondary;
  final Color? textOnPrimary;
  final Color? textOnSecondary;
  final Color? textOnTertiary;
  final Color? textOnError;
  final Color? textLink;
  final Color? textError;
  final Color? textWarning;
  final Color? shadow;
  final Color? warning;

  const LzyctColors({
    this.background,
    this.surface,
    this.surfaceVariant,
    this.onPrimary,
    this.onSurfaceVariant,
    this.textPrimary,
    this.textSecondary,
    this.textOnPrimary,
    this.textOnSecondary,
    this.textOnTertiary,
    this.textOnError,
    this.textLink,
    this.textError,
    this.textWarning,
    this.shadow,
    this.warning,
  });

  @override
  ThemeExtension<LzyctColors> copyWith({
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? onPrimary,
    Color? onSurfaceVariant,
    Color? textPrimary,
    Color? textSecondary,
    Color? textOnPrimary,
    Color? textOnSecondary,
    Color? textOnTertiary,
    Color? textOnError,
    Color? textLink,
    Color? textError,
    Color? textWarning,
    Color? shadow,
    Color? warning,
  }) => LzyctColors(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    surfaceVariant: surfaceVariant ?? this.surfaceVariant,
    onPrimary: onPrimary ?? this.onPrimary,
    onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
    textPrimary: textPrimary ?? this.textPrimary,
    textSecondary: textSecondary ?? this.textSecondary,
    textOnPrimary: textOnPrimary ?? this.textOnPrimary,
    textOnSecondary: textOnSecondary ?? this.textOnSecondary,
    textOnTertiary: textOnTertiary ?? this.textOnTertiary,
    textOnError: textOnError ?? this.textOnError,
    textLink: textLink ?? this.textLink,
    textError: textError ?? this.textError,
    textWarning: textWarning ?? this.textWarning,
    shadow: shadow ?? this.shadow,
    warning: warning ?? this.warning,
  );

  @override
  ThemeExtension<LzyctColors> lerp(
    covariant ThemeExtension<LzyctColors>? other,
    double t,
  ) {
    if (other is! LzyctColors) {
      return this;
    }
    return LzyctColors(
      background: Color.lerp(background, other.background, t),
      surface: Color.lerp(surface, other.surface, t),
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t),
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t),
      onSurfaceVariant: Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t),
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t),
      textOnSecondary: Color.lerp(textOnSecondary, other.textOnSecondary, t),
      textOnTertiary: Color.lerp(textOnTertiary, other.textOnTertiary, t),
      textOnError: Color.lerp(textOnError, other.textOnError, t),
      textLink: Color.lerp(textLink, other.textLink, t),
      textError: Color.lerp(textError, other.textError, t),
      textWarning: Color.lerp(textWarning, other.textWarning, t),
      shadow: Color.lerp(shadow, other.shadow, t),
      warning: Color.lerp(warning, other.warning, t),
    );
  }
}

class BoxDecorations {
  BoxDecorations(this.context);

  final BuildContext context;

  BoxDecoration get button => BoxDecoration(
    color: ColorScheme.of(context).primary,
    borderRadius: const BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
  );

  /// Flat card: hairline border instead of a drop shadow.
  BoxDecoration get card => BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: const BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    border: Border.all(color: ColorScheme.of(context).outline),
  );

  BoxDecoration get item => BoxDecoration(
    color: ColorScheme.of(context).surfaceContainer,
    borderRadius: const BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
  );

  BoxDecoration get navigation => BoxDecoration(
    color: ColorScheme.of(context).surfaceContainer,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.space16)),
    boxShadow: [BoxShadows(context).navigation],
  );
}

class BoxShadows {
  BoxShadows(this.context);

  final BuildContext context;

  BoxShadow get button => BoxShadow(
    color: ColorScheme.of(context).primary.withValues(alpha: 0.24),
    offset: Offset(0, Dimens.space6),
    blurRadius: Dimens.space16,
    spreadRadius: -Dimens.space4,
  );

  BoxShadow get card => BoxShadow(
    color: ColorScheme.of(context).shadow.withAlpha(10),
    blurRadius: 5.0,
    spreadRadius: 0.5,
  );

  BoxShadow get dialog => BoxShadow(
    color: ColorScheme.of(context).shadow.withAlpha(30),
    offset: const Offset(0, -4),
    blurRadius: 16.0,
  );

  BoxShadow get dialogAlt => BoxShadow(
    color: ColorScheme.of(context).shadow.withAlpha(30),
    offset: const Offset(0, 4),
    blurRadius: 16.0,
  );

  BoxShadow get buttonMenu => BoxShadow(
    color: ColorScheme.of(context).shadow.withAlpha(10),
    blurRadius: 4.0,
  );

  BoxShadow get navigation => BoxShadow(
    color: ColorScheme.of(context).shadow.withAlpha(30),
    blurRadius: Dimens.space6,
    offset: Offset(0, Dimens.space6),
  );
}
