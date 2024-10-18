import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GeneralTokenX', () {
    test('returns correct values for GeneralToken.loading', () {
      const status = GeneralTokenState.loading();
      expect(status, const GeneralTokenState.loading());
    });

    test('returns correct values for GeneralToken.success', () {
      const status = GeneralTokenState.success(null);
      expect(status, const GeneralTokenState.success(null));
    });

    test('returns correct values for GeneralToken.failure', () {
      const status = GeneralTokenState.failure("");
      expect(status, const GeneralTokenState.failure(""));
    });
  });
}
