import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_app/config.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: OKToast(
        child: ScreenUtilInit(
          /// Set screen size to make responsive
          /// Almost all device

          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, __) => BlocBuilder<SettingsCubit, int>(
            builder: (_, __) => MaterialApp(
              localizationsDelegates: const [
                Strings.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              builder: (BuildContext context, Widget? child) {
                final MediaQueryData data = MediaQuery.of(context);

                return MediaQuery(
                  data: data.copyWith(
                    textScaleFactor: 1,
                    alwaysUse24HourFormat: true,
                  ),
                  child: child!,
                );
              },
              title: Constants.get.appName,
              theme: themeLight,
              darkTheme: themeDark,
              locale: Locale(sl<PrefManager>().locale),
              supportedLocales: L10n.all,
              themeMode:

                  /// Check if theme is light or dark first
                  sl<PrefManager>().theme == describeEnum(ActiveTheme.light)
                      ? ThemeMode.light
                      : sl<PrefManager>().theme ==
                              describeEnum(ActiveTheme.dark)
                          ? ThemeMode.dark

                          /// Set default theme is System
                          : ThemeMode.system,
              onGenerateRoute: (RouteSettings settings) {
                final routes = AppRoute.getRoutes(settings: settings);
                final WidgetBuilder? builder = routes[settings.name];

                return MaterialPageRoute(
                  builder: (context) => builder!(context),
                  settings: settings,
                );
              },
              initialRoute: AppRoute.splashScreen,
            ),
          ),
        ),
      ),
    );
  }
}
