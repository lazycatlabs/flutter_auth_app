import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/data/datasources/datasources.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/presentation/pages/pages.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum Routes {
  root("/"),
  splashScreen("/splashscreen"),

  /// Home Page
  mainScreen("/home/:screen(dashboard|settings)"),
  dashboard("/home/dashboard"),
  settings("/home/settings"),
  // Auth Page
  login("/auth/login"),
  register("/auth/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => SplashScreenPage(),
      ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_) => Routes.dashboard.path,
      ),
      GoRoute(
        path: Routes.mainScreen.path,
        name: Routes.mainScreen.name,
        builder: (_, state) {
          final screen = state.params['screen'] ?? "";

          return MainPage(key: state.pageKey, screen: screen);
        },
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => BlocProvider(
          create: (_) => sl<RegisterCubit>(),
          child: const RegisterPage(),
        ),
      ),
    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
    redirect: (GoRouterState state) {
      final bool isLoginPage = state.subloc == Routes.login.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!sl<PrefManager>().isLogin) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage && sl<PrefManager>().isLogin) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );
}
