import 'package:flutter/material.dart';

class L10n {
  L10n._();

  static final all = [
    const Locale('en'),
    const Locale('id'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'id':
        return 'Bahasa';
      case 'en':
      default:
        return 'English';
    }
  }
}
