import 'package:flutter/material.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  AppRoute._();

  //define page route name
  static const String splashScreen = "splashscreen";
  static const String mainScreen = "main";

  /// Auth
  static const String login = "auth/login";
  static const String register = "auth/register";

  //define page route
  static Map<String, WidgetBuilder> getRoutes({RouteSettings? settings}) => {
        splashScreen: (_) => SplashScreenPage(),
        mainScreen: (_) {
          // final Map<String?, Object?>? _args =
          //     settings?.arguments as Map<String?, Object?>?;
          return BlocProvider(
            create: (_) => sl<NavDrawerCubit>(),
            child: const MainPage(),
          );
        },

        /// Auth
        login: (_) => BlocProvider(
          create: (_) => sl<LoginCubit>(),
              child: const LoginPage(),
            ),
        register: (_) => BlocProvider(
          create: (_) => sl<RegisterCubit>(),
              child: const RegisterPage(),
            ),
      };
}
