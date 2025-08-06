import 'dart:isolate';

import 'package:flutter_auth_app/core/core.dart';

class IsolateParser<T> {
  final Map<String, dynamic> json;

  ResponseConverter<T> converter;

  IsolateParser(this.json, this.converter);

  Future<T> parseInBackground() async {
    final port = ReceivePort();
    await Isolate.spawn(_parseListOfJson, port.sendPort);

    final result = await port.first;
    return result as T;
  }

  void _parseListOfJson(SendPort sendPort) {
    final result = converter(json);
    Isolate.exit(sendPort, result);
  }
}
