import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
    required this.dataMenu,
    required this.currentIndex,
    required this.onLogoutPressed,
  });

  final List<DataHelper> dataMenu;
  final Function(int) currentIndex;
  final VoidCallback onLogoutPressed;

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Palette.hint,
                    radius: Dimens.space36 + Dimens.space2,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(Images.icLauncher),
                      radius: Dimens.space36,
                    ),
                  ),
                  const SpacerH(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "LazyCat Labs",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(color: Palette.white),
                        ),
                        Text(
                          "lazycatlabs@gmail.com",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SpacerV(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.dataMenu
                .map<Widget>(
                  (value) => SizedBox(
                    width: double.maxFinite,
                    child: InkWell(
                      onTap: () {
                        for (final menu in widget.dataMenu) {
                          menu.isSelected = menu.title == value.title;

                          if (value.title != null) {
                            widget.currentIndex(
                              widget.dataMenu.indexOf(value),
                            );
                          }
                        }

                        _selectedPage(value.title!);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Dimens.space12,
                          horizontal: Dimens.space24,
                        ),
                        child: Text(
                          value.title!,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ), //
          const SpacerH(),
        ],
      ),
    );
  }

  void _selectedPage(String title) {
    //TODO : Update page from selected Page
    if (title == Strings.of(context)!.settings) {
      context.go(Routes.settings.path);
    } else if (title == Strings.of(context)!.dashboard) {
      context.go(Routes.dashboard.path);
    } else if (title == Strings.of(context)!.logout) {
      widget.onLogoutPressed.call();
    }
  }
}
