import 'dart:async';

import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(List<Stream<dynamic>> streams) {
    notifyListeners();
    for (final stream in streams) {
      stream.listen((dynamic _) => notifyListeners());
    }
  }

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  void dispose() {
    try {
      for (final subscription in _subscriptions) {
        subscription.cancel(); //coverage:ignore-line
      }
    } catch (_) {}
    super.dispose();
  }
}
