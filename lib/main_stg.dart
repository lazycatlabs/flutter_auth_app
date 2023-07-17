import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/config.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/lzyct_app.dart';
import 'package:flutter_auth_app/utils/utils.dart';

void main() {
  runZonedGuarded(
    /// Lock device orientation to portrait
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Register Service locator
      await serviceLocator();
      await FirebaseServices.init();

      /// Set env as staging
      environment = Environment.staging;

      return SystemChrome.setPreferredOrientations(
        [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      ).then((_) => runApp(LzyctApp()));
    },
    (error, stackTrace) async {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    },
  );
}
