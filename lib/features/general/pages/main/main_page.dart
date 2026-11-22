import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

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
  Widget build(BuildContext context) => PopScope(
    canPop: context.select<MainCubit, bool>(
      (cubit) => cubit.state == MainMenu.dashboard,
    ),
    onPopInvokedWithResult: (didPop, _) {
      if (!didPop) {
        context.read<MainCubit>().select(MainMenu.dashboard);
        context.goNamed(Routes.dashboard.name);
      }
    },
    child: Parent(
      scaffoldKey: _scaffoldKey,
      appBar: _MainAppBar(
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
      ),
      drawer: SizedBox(
        width: context.widthInPercent(78),
        child: BlocProvider(
          //coverage:ignore-start
          create: (_) => sl<UserCubit>()..getUser(),
          child: MenuDrawer(
            selected: context.watch<MainCubit>().state,
            onSelected: (menu) {
              if (menu.route != null) {
                context.read<MainCubit>().select(menu);
              }

              /// hide navigation drawer
              _scaffoldKey.currentState?.closeDrawer();
            },
            onLogoutPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                icon: Icon(
                  Icons.logout_rounded,
                  color: ColorScheme.of(context).error,
                ),
                title: Text(Strings.of(context)!.logout),
                content: Text(Strings.of(context)!.logoutDesc),
                actions: [
                  TextButton(
                    onPressed: () => context.pop(),
                    child: Text(
                      Strings.of(context)!.cancel,
                      style: TextTheme.of(context).bodyMedium600?.copyWith(
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
                        style: TextTheme.of(context).bodyMedium600?.copyWith(
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
