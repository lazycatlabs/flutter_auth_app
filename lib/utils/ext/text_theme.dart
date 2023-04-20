import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  TextStyle? get bodyLarge700 => bodyLarge?.copyWith(
        fontWeight: FontWeight.w700,
      );

  TextStyle? get bodyLarge500 => bodyLarge?.copyWith(
        fontWeight: FontWeight.w500,
      );
}
