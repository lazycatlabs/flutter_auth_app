import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return WillPopScope(
      onWillPop: () async {
        return context.read<MainCubit>().onBackPressed(context, _scaffoldKey);
      },
      child: Parent(
        scaffoldKey: _scaffoldKey,
        appBar: _appBar(),
        drawer: SizedBox(
          width: context.widthInPercent(80),
          child: MenuDrawer(
            dataMenu: context.read<MainCubit>().dataMenus,
            currentIndex: (int index) {
              /// don't update when index is logout
              if (index != 2) {
                context.read<MainCubit>().updateIndex(index);
              }

              /// hide navigation drawer
              _scaffoldKey.currentState?.openEndDrawer();
            },
            onLogoutPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(
                    Strings.of(context)!.logout,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  content: Text(
                    Strings.of(context)!.logoutDesc,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => context.back(),
                      child: Text(
                        Strings.of(context)!.cancel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .extension<LzyctColors>()!
                                  .subtitle,
                            ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthCubit>().logout();
                      },
                      child: Text(
                        Strings.of(context)!.yes,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .extension<LzyctColors>()!
                                  .red,
                            ),
                      ),
                    ),
                  ],
                ),
              );
            },
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
                loading: () => "-",
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
            color: Theme.of(context).extension<LzyctColors>()!.pink,
            semanticLabel: "Menu",
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: const [
          /// Notification on Dashboard
          ButtonNotification(),
        ],
      ),
    );
  }
}
