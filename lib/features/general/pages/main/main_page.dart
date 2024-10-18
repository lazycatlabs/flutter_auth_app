import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.child});

  final Widget child;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainCubit>().initMenu(context);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (_, __) =>
          context.read<MainCubit>().onBackPressed(context, _scaffoldKey),
      child: Parent(
        scaffoldKey: _scaffoldKey,
        appBar: _appBar(),
        drawer: SizedBox(
          width: context.widthInPercent(80),
          child: BlocProvider(
            //coverage:ignore-start
            create: (_) => sl<UserCubit>()..getUser(),
            child: MenuDrawer(
              dataMenu: context.read<MainCubit>().dataMenus ??
                  [
                    DataHelper(title: "Dashboard", isSelected: true),
                    DataHelper(title: "Settings"),
                    DataHelper(title: "Logout"),
                  ],
              currentIndex: (int index) {
                /// don't update when index is logout
                if (index != 2) {
                  context.read<MainCubit>().updateIndex(index, null);
                }

                /// hide navigation drawer
                _scaffoldKey.currentState?.openEndDrawer();
              },
              onLogoutPressed: () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    Strings.of(context)!.logout,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color:
                              Theme.of(context).extension<LzyctColors>()!.red,
                        ),
                  ),
                  content: Text(
                    Strings.of(context)!.logoutDesc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
                      child: Text(
                        Strings.of(context)!.cancel,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Theme.of(context).hintColor),
                      ),
                    ),
                    BlocListener<LogoutCubit, LogoutState>(
                      listener: (ctx, state) => state.whenOrNull(
                        loading: () => ctx.show(),
                        success: (message) {
                          ctx.dismiss();
                          message.toToastSuccess(context);
                          context.goNamed(Routes.root.name);
                          return;
                        },
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<LogoutCubit>().postLogout();
                        },
                        child: Text(
                          Strings.of(context)!.yes,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context)
                                        .extension<LzyctColors>()!
                                        .red,
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

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: BlocBuilder<MainCubit, MainState>(
          builder: (_, state) {
            return Text(
              state.when(
                loading: () => "-", //coverage:ignore-line
                success: (data) => data?.title ?? "-",
              ),
              style: Theme.of(context).textTheme.titleLarge,
            );
          },
        ),
        leading: IconButton(
          icon: Icon(
            Icons.sort,
            size: Dimens.space24,
            semanticLabel: "Menu",
          ),
          //coverage:ignore-start
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          //coverage:ignore-end
        ),
        actions: const [
          /// Notification on Dashboard
          ButtonNotification(),
        ],
      ),
    );
  }
}
