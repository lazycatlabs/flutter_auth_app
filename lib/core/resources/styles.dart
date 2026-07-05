import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/core/core.dart';

/// Light theme
ThemeData themeLight(BuildContext context) => ThemeData(
  fontFamily: 'BeVietnamPro',
  useMaterial3: true,
  primaryColor: Palette.primary,
  disabledColor: Palette.outline,
  hintColor: Palette.onSurfaceVariant,
  cardColor: Palette.surface,
  scaffoldBackgroundColor: Palette.background,
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
    surfaceContainerHighest: Palette.surfaceVariant,
    onSurfaceVariant: Palette.onSurfaceVariant,
    outline: Palette.outline,
  ),
  textTheme: TextTheme(
    displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: Dimens.displayLarge,
      color: Palette.textPrimary,
    ),
    displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
      fontSize: Dimens.displayMedium,
      color: Palette.textPrimary,
    ),
    displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
      fontSize: Dimens.displaySmall,
      color: Palette.textPrimary,
    ),
    headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: Dimens.headlineMedium,
      color: Palette.textPrimary,
    ),
    headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontSize: Dimens.headlineSmall,
      color: Palette.textPrimary,
    ),
    titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: Dimens.titleLarge,
      color: Palette.textPrimary,
    ),
    titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: Dimens.titleMedium,
      color: Palette.textPrimary,
    ),
    titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
      fontSize: Dimens.titleSmall,
      color: Palette.textPrimary,
    ),
    bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: Dimens.bodyLarge,
      color: Palette.textPrimary,
    ),
    bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: Dimens.bodyMedium,
      color: Palette.textPrimary,
    ),
    bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: Dimens.bodySmall,
      color: Palette.textPrimary,
    ),
    labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
      fontSize: Dimens.labelLarge,
      color: Palette.textPrimary,
    ),
    labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
      fontSize: Dimens.labelSmall,
      letterSpacing: 0.25,
      color: Palette.textPrimary,
    ),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(color: Palette.textPrimary),
    backgroundColor: Palette.background,
    iconTheme: const IconThemeData(color: Palette.onSurface),
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
    surfaceTintColor: Palette.background,
    shadowColor: Palette.shadow.withValues(alpha: 0.1),
  ),
  drawerTheme: const DrawerThemeData().copyWith(
    elevation: Dimens.zero,
    surfaceTintColor: Palette.surface,
    backgroundColor: Palette.background,
  ),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    backgroundColor: Palette.surface,
    surfaceTintColor: Colors.transparent,
    elevation: Dimens.zero,
  ),
  dialogTheme: const DialogThemeData().copyWith(
    backgroundColor: Palette.surface,
    surfaceTintColor: Colors.transparent,
    elevation: Dimens.zero,
  ),
  brightness: Brightness.light,
  iconTheme: const IconThemeData(color: Palette.onSurface),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  extensions: const <ThemeExtension<dynamic>>[
    LzyctColors(
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
      primary: Palette.primary,
      tertiary: Palette.tertiary,
      error: Palette.error,
      errorContainer: Palette.errorContainer,
      warning: Palette.warning,
    ),
  ],
);

/// Dark theme
ThemeData themeDark(BuildContext context) => ThemeData(
  fontFamily: 'BeVietnamPro',
  useMaterial3: true,
  primaryColor: Palette.primaryDark,
  disabledColor: Palette.outlineDark,
  hintColor: Palette.onSurfaceVariantDark,
  cardColor: Palette.surfaceDark,
  scaffoldBackgroundColor: Palette.backgroundDark,
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
    surfaceContainerHighest: Palette.surfaceVariantDark,
    onSurfaceVariant: Palette.onSurfaceVariantDark,
    outline: Palette.outlineDark,
  ),
  textTheme: TextTheme(
    displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: Dimens.displayLarge,
      color: Palette.textPrimaryDark,
    ),
    displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
      fontSize: Dimens.displayMedium,
      color: Palette.textPrimaryDark,
    ),
    displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
      fontSize: Dimens.displaySmall,
      color: Palette.textPrimaryDark,
    ),
    headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: Dimens.headlineMedium,
      color: Palette.textPrimaryDark,
    ),
    headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
      fontSize: Dimens.headlineSmall,
      color: Palette.textPrimaryDark,
    ),
    titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
      fontSize: Dimens.titleLarge,
      color: Palette.textPrimaryDark,
    ),
    titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: Dimens.titleMedium,
      color: Palette.textPrimaryDark,
    ),
    titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
      fontSize: Dimens.titleSmall,
      color: Palette.textPrimaryDark,
    ),
    bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
      fontSize: Dimens.bodyLarge,
      color: Palette.textPrimaryDark,
    ),
    bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: Dimens.bodyMedium,
      color: Palette.textPrimaryDark,
    ),
    bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: Dimens.bodySmall,
      color: Palette.textPrimaryDark,
    ),
    labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
      fontSize: Dimens.labelLarge,
      color: Palette.textPrimaryDark,
    ),
    labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
      fontSize: Dimens.labelSmall,
      letterSpacing: 0.25,
      color: Palette.textPrimaryDark,
    ),
  ),
  appBarTheme: const AppBarTheme().copyWith(
    titleTextStyle: Theme.of(
      context,
    ).textTheme.bodyLarge?.copyWith(color: Palette.textPrimaryDark),
    iconTheme: const IconThemeData(color: Palette.onSurfaceDark),
    backgroundColor: Palette.backgroundDark,
    systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
    ),
    surfaceTintColor: Palette.backgroundDark,
    shadowColor: Palette.shadowDark.withValues(alpha: 0.28),
  ),
  drawerTheme: const DrawerThemeData().copyWith(
    elevation: Dimens.zero,
    surfaceTintColor: Palette.surfaceDark,
    backgroundColor: Palette.backgroundDark,
    shadowColor: Palette.shadowDark.withValues(alpha: 0.28),
  ),
  bottomSheetTheme: const BottomSheetThemeData().copyWith(
    backgroundColor: Palette.surfaceDark,
    surfaceTintColor: Colors.transparent,
    elevation: Dimens.zero,
  ),
  dialogTheme: const DialogThemeData().copyWith(
    backgroundColor: Palette.surfaceDark,
    surfaceTintColor: Colors.transparent,
    elevation: Dimens.zero,
  ),
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: Palette.onSurfaceDark),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  extensions: const <ThemeExtension<dynamic>>[
    LzyctColors(
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
      primary: Palette.primaryDark,
      tertiary: Palette.tertiaryDark,
      error: Palette.errorDark,
      errorContainer: Palette.errorContainerDark,
      warning: Palette.warningDark,
    ),
  ],
);

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
  final Color? primary;
  final Color? tertiary;
  final Color? error;
  final Color? errorContainer;
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
    this.primary,
    this.tertiary,
    this.error,
    this.errorContainer,
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
    Color? primary,
    Color? tertiary,
    Color? error,
    Color? errorContainer,
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
    primary: primary ?? this.primary,
    tertiary: tertiary ?? this.tertiary,
    error: error ?? this.error,
    errorContainer: errorContainer ?? this.errorContainer,
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
      primary: Color.lerp(primary, other.primary, t),
      tertiary: Color.lerp(tertiary, other.tertiary, t),
      error: Color.lerp(error, other.error, t),
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t),
      warning: Color.lerp(warning, other.warning, t),
    );
  }
}

class BoxDecorations {
  BoxDecorations(this.context);

  final BuildContext context;

  BoxDecoration get button => BoxDecoration(
    color: Theme.of(context).colorScheme.primary,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows(context).button],
  );

  BoxDecoration get card => BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
    boxShadow: [BoxShadows(context).card],
  );

  BoxDecoration get item => BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.cornerRadius)),
  );

  BoxDecoration get navigation => BoxDecoration(
    color: Theme.of(context).cardColor,
    borderRadius: BorderRadius.all(Radius.circular(Dimens.space16)),
    boxShadow: [BoxShadows(context).navigation],
  );
}

class BoxShadows {
  BoxShadows(this.context);

  final BuildContext context;

  BoxShadow get button => BoxShadow(
    color: Theme.of(context).colorScheme.shadow.withAlpha(10),
    blurRadius: 16.0,
    spreadRadius: 1.0,
  );

  BoxShadow get card => BoxShadow(
    color: Theme.of(context).colorScheme.shadow.withAlpha(10),
    blurRadius: 5.0,
    spreadRadius: 0.5,
  );

  BoxShadow get dialog => BoxShadow(
    color: Theme.of(context).colorScheme.shadow.withAlpha(30),
    offset: const Offset(0, -4),
    blurRadius: 16.0,
  );

  BoxShadow get dialogAlt => BoxShadow(
    color: Theme.of(context).colorScheme.shadow.withAlpha(30),
    offset: const Offset(0, 4),
    blurRadius: 16.0,
  );

  BoxShadow get buttonMenu => BoxShadow(
    color: Theme.of(context).colorScheme.shadow.withAlpha(10),
    blurRadius: 4.0,
  );

  BoxShadow get navigation => BoxShadow(
    color: Theme.of(context).colorScheme.shadow.withAlpha(30),
    blurRadius: Dimens.space6,
    offset: Offset(0, Dimens.space6),
  );
}
