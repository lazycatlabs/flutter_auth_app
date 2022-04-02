import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    Key? key,
    required this.dataMenu,
    required this.currentIndex,
  }) : super(key: key);
  final List<DataHelper> dataMenu;
  final Function(int) currentIndex;

  @override
  _MenuDrawerState createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).primaryColor,
            child: SafeArea(
              child: Row(
                children: [
                  CircleImage(
                    size: Dimens.profilePicture,
                    url: Constants.get.imagePlaceHolder,
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
            children: widget.dataMenu
                .map<Widget>(
                  (value) => InkWell(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: Dimens.space12,
                            horizontal: Dimens.space16,
                          ),
                          child: Row(
                            children: [
                              // if (value.icon != null)
                              //   Icon(
                              //     value.icon,
                              //     color: Palette.hint,
                              //   )
                              // else
                              //   SvgPicture.asset(
                              //     value.iconPath!,
                              //     color: Palette.hint,
                              //   ),
                              const SpacerH(),
                              Text(
                                value.title!,
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ],
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

  //TODO : Update page from selected Page
  void _selectedPage(String title) {
    //TODO : Update page from selected Page
    if (title == Strings.of(context)!.settings) {
      context.read<NavDrawerCubit>().openDrawer(Navigation.settingsPage);
    } else if (title == Strings.of(context)!.dashboard) {
      context.read<NavDrawerCubit>().openDrawer(Navigation.dashboardPage);
    }
  }
}
