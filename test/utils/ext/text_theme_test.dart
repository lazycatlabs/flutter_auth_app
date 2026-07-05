import 'package:flutter/material.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bodyLarge500 returns bodyLarge with medium weight', () {
    const textTheme = TextTheme(bodyLarge: TextStyle(fontSize: 16));

    expect(textTheme.bodyLarge500?.fontWeight, FontWeight.w500);
    expect(textTheme.bodyLarge500?.fontSize, 16);
  });
}
