import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('L10n', () {
    test('all locales', () {
      expect(L10n.all, contains(const Locale('en')));
      expect(L10n.all, contains(const Locale('id')));
    });

    test('getFlag returns correct language name', () {
      expect(L10n.getFlag('en'), equals('English'));
      expect(L10n.getFlag('id'), equals('Bahasa'));
    });

    test('getFlag returns default language name for unknown code', () {
      expect(L10n.getFlag('unknown'), equals('English'));
    });
  });
}
