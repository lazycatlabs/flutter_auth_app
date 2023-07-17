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
  token,
  fcm,
  language,
  theme,
  locale,
  isLogin,
}

mixin class MainBoxMixin {
  static late Box? mainBox;
  static const _boxName = 'yotta!mainBox';

  static Future<void> initHive() async {
    // Initialize hive (persistent database)
    await Hive.initFlutter();
    mainBox = await Hive.openBox(_boxName);
  }

  Future<void> addData<T>(MainBoxKeys key, T value) async {
    await mainBox?.put(key.name, value);
  }

  Future<void> removeData(MainBoxKeys key) async {
    await mainBox?.delete(key.name);
  }

  T getData<T>(MainBoxKeys key) => mainBox?.get(key.name) as T;

  Future<void> logoutBox() async {
    final fcm = getData(MainBoxKeys.fcm);

    /// Clear the box
    await mainBox?.clear();

    /// Add back the data
    await addData(MainBoxKeys.fcm, fcm);
  }

  Future<void> close() async {
    try {
      if (mainBox != null) {
        await mainBox?.close();
        await mainBox?.deleteFromDisk();
      }
    } catch (_) {}
  }
}
