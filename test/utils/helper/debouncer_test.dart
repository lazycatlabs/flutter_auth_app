import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Debouncer', () {
    test('action is called after the specified duration', () async {
      bool actionCalled = false;
      final debouncer = Debouncer(duration: const Duration(milliseconds: 100));

      debouncer.run(() => actionCalled = true);

      // Wait for the duration to pass
      await Future.delayed(const Duration(milliseconds: 150));

      expect(actionCalled, isTrue);
    });

    test('action is not called if debouncer is reset before duration',
        () async {
      bool actionCalled = false;
      final debouncer = Debouncer(duration: const Duration(milliseconds: 100));

      debouncer.run(() => actionCalled = true);

      // Reset the debouncer before the duration passes
      await Future.delayed(const Duration(milliseconds: 50));
      debouncer.run(() {});

      // Wait for the original duration to pass
      await Future.delayed(const Duration(milliseconds: 100));

      expect(actionCalled, isFalse);
    });

    test('new action is called after debouncer is reset', () async {
      bool firstActionCalled = false;
      bool secondActionCalled = false;
      final debouncer = Debouncer(duration: const Duration(milliseconds: 100));

      debouncer.run(() => firstActionCalled = true);

      // Reset the debouncer before the duration passes
      await Future.delayed(const Duration(milliseconds: 50));
      debouncer.run(() => secondActionCalled = true);

      // Wait for the duration to pass
      await Future.delayed(const Duration(milliseconds: 150));

      expect(firstActionCalled, isFalse);
      expect(secondActionCalled, isTrue);
    });
  });
}
