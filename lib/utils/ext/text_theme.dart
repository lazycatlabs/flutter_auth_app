import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  TextStyle? get titleLargeBold =>
      titleLarge?.copyWith(fontWeight: FontWeight.bold);

  TextStyle? get bodyMedium500 =>
      bodyMedium?.copyWith(fontWeight: FontWeight.w500);
}
