import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReloadFormX', () {
    test('returns correct values for ReloadForm.initial', () {
      const status = ReloadFormState.initial();
      expect(status, const ReloadFormState.initial());
    });

    test('returns correct values for ReloadForm.formUpdated', () {
      const status = ReloadFormState.formUpdated();
      expect(status, const ReloadFormState.formUpdated());
    });
  });
}
