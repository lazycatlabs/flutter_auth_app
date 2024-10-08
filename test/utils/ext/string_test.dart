import 'package:flutter_auth_app/utils/ext/string.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  test('isValidEmail returns true for valid email', () {
    expect('test@example.com'.isValidEmail(), isTrue);
  });

  test('isValidEmail returns false for invalid email', () {
    expect('invalid-email'.isValidEmail(), isFalse);
  });

  test('toStringDateAlt returns formatted date', () {
    // Initialize date formatting for the desired locale
    initializeDateFormatting('id');

    /// the time is convert to local time
    expect('2023-10-01T12:34:56Z'.toStringDateAlt(), '01 Oktober 2023 20:34');
  });

  test('toStringDateAlt returns "-" for invalid date', () {
    expect('invalid-date'.toStringDateAlt(), '-');
  });
}
