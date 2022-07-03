import 'package:flutter/material.dart';

class MyAppBar {
  const MyAppBar();

  PreferredSize call() => PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(elevation: 0),
      );
}
