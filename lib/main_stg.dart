import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/config.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/my_app.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  /// Register Service locator
  await serviceLocator();

  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseServices().init();

  /// Set status bar icon color
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );

  /// Set env as staging
  environment = Environment.staging;

  runZonedGuarded(
    /// Lock device orientation to portrait
    () => SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((_) async {
      /// Load SharedPref before load My App Widget
      SharedPreferences.getInstance().then((value) {
        initPrefManager(value);
        runApp(MyApp());
      });
    }),
    (error, stackTrace) async {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
