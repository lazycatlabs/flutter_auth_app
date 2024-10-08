import 'dart:async';

import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GoRouterRefreshStream', () {
    test('notifies listeners when streams emit events', () async {
      final streamController1 = StreamController<dynamic>();
      final streamController2 = StreamController<dynamic>();

      final goRouterRefreshStream = GoRouterRefreshStream([
        streamController1.stream,
        streamController2.stream,
      ]);

      bool notified = false;
      goRouterRefreshStream.addListener(() {
        notified = true;
      });

      streamController1.add(null);
      await Future.delayed(Duration.zero);

      expect(notified, isTrue);

      streamController1.close();
      streamController2.close();
    });

    test('cancels subscriptions on dispose', () async {
      final streamController1 = StreamController<dynamic>();
      final streamController2 = StreamController<dynamic>();

      final goRouterRefreshStream = GoRouterRefreshStream([
        streamController1.stream,
        streamController2.stream,
      ]);

      goRouterRefreshStream.dispose();

      expect(() => streamController1.add(null), isA<Function()>());
      expect(() => streamController2.add(null), isA<Function()>());

      streamController1.close();
      streamController2.close();
    });
  });
}
