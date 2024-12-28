import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum ActiveTheme {
  light(ThemeMode.light),
  dark(ThemeMode.dark),
  system(ThemeMode.system);

  final ThemeMode mode;

  const ActiveTheme(this.mode);
}

enum MainBoxKeys {
  generalToken,
  authToken,
  fcm,
  language,
  theme,
  locale,
  isLogin,
}

mixin class MainBoxMixin {
  static late Box? mainBox;
  static const _boxName = 'flutter_auth_app';

  static Future<void> initHive(String prefixBox) async {
    // Initialize hive (persistent database)
    await Hive.initFlutter();
    mainBox = await Hive.openBox("$prefixBox$_boxName");
  }

  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(MainBoxKeys key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

  Future<void> logoutBox() async {
    /// Clear the box
    await removeData(MainBoxKeys.isLogin);
    await removeData(MainBoxKeys.authToken);
  }
}
