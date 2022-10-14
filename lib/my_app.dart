import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_auth_app/utils/helper/helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SettingsCubit>()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          /// Set screen size to make responsive
          /// Almost all device

          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, __) {
            /// Pass context to appRoute
            AppRoute.setStream(context);

            return BlocBuilder<SettingsCubit, int>(
              builder: (_, __) => MaterialApp.router(
                routeInformationProvider:
                    AppRoute.router.routeInformationProvider,
                routeInformationParser: AppRoute.router.routeInformationParser,
                routerDelegate: AppRoute.router.routerDelegate,
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
              ),
            );
          },
        ),
      ),
    );
  }
}
