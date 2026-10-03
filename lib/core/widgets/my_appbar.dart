import 'package:material_ui/material_ui.dart';

class MyAppBar {
  const MyAppBar();

  PreferredSize call() => PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: AppBar(elevation: 0),
  );
}
