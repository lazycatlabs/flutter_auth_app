import 'dart:async';

import 'package:material_ui/material_ui.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(List<Stream<dynamic>> streams) {
    notifyListeners();
    _subscriptions = [
      for (final stream in streams)
        stream.listen((dynamic _) => notifyListeners()),
    ];
  }

  late final List<StreamSubscription<dynamic>> _subscriptions;

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
