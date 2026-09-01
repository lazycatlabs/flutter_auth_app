import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'main_app_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({required this.child, super.key});

  final Widget child;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCubit>().initMenu([
      DataHelper(title: Strings.of(context)!.dashboard, isSelected: true),
      DataHelper(title: Strings.of(context)!.settings),
      DataHelper(title: Strings.of(context)!.logout),
    ]);
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: context.select<MainCubit, bool>((cubit) => cubit.currentIndex == 0),
    onPopInvokedWithResult: (didPop, _) {
      if (!didPop) {
        context.read<MainCubit>().updateIndex(0);
        context.goNamed(Routes.dashboard.name);
      }
    },
    child: Parent(
      scaffoldKey: _scaffoldKey,
      appBar: _MainAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: SizedBox(
        width: context.widthInPercent(80),
        child: BlocProvider(
          //coverage:ignore-start
          create: (_) => sl<UserCubit>()..getUser(),
          child: MenuDrawer(
            dataMenu: context.read<MainCubit>().dataMenus,
            currentIndex: (int index) {
              /// don't update when index is logout
              if (index != 2) {
                context.read<MainCubit>().updateIndex(index);
              }

              /// hide navigation drawer
              _scaffoldKey.currentState?.closeDrawer();
            },
            onLogoutPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(
                  Strings.of(context)!.logout,
                  style: TextTheme.of(
                    context,
                  ).bodyLarge?.copyWith(color: ColorScheme.of(context).error),
                ),
                content: Text(
                  Strings.of(context)!.logoutDesc,
                  style: TextTheme.of(context).bodyMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      Strings.of(context)!.cancel,
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        color: ColorScheme.of(context).onSurfaceVariant,
                      ),
                    ),
                  ),
                  BlocListener<LogoutCubit, LogoutState>(
                    listener: (ctx, state) => switch (state) {
                      LogoutStateLoading() => ctx.show(),
                      LogoutStateFailure(:final message) => (() {
                        ctx.dismiss();
                        message.toToastError(context);
                      })(),
                      LogoutStateSuccess(:final message) => (() {
                        ctx.dismiss();
                        message.toToastSuccess(context);
                        context.goNamed(Routes.root.name);
                      })(),
                    },
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<LogoutCubit>().postLogout();
                      },
                      child: Text(
                        Strings.of(context)!.yes,
                        style: TextTheme.of(context).bodyMedium?.copyWith(
                          color: ColorScheme.of(context).error,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //coverage:ignore-end
        ),
      ),
      child: widget.child,
    ),
  );
}
