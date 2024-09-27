import 'dart:developer' as developer;

import 'package:logger/logger.dart';

final log = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    lineLength: 110,
  ),
  output: MyConsoleOutput(),
);

class MyConsoleOutput extends ConsoleOutput {
  @override
  void output(OutputEvent event) => event.lines.forEach(developer.log);
}
