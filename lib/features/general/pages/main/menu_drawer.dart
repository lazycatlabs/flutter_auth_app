import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

part 'menu_drawer_header.dart';
part 'menu_drawer_item.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    required this.selected,
    required this.onSelected,
    required this.onLogoutPressed,
    super.key,
  });

  final MainMenu selected;
  final ValueChanged<MainMenu> onSelected;
  final VoidCallback onLogoutPressed;

  @override
  Widget build(BuildContext context) => Drawer(
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Dimens.space24),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (_, state) => AnimatedSwitcher(
                duration: Motion.medium,
                child: switch (state) {
                  UserStateLoading() => const Skeletonizer(
                    child: _MenuDrawerHeader(
                      user: User(
                        name: 'Placeholder Name',
                        email: 'placeholder@mail.com',
                      ),
                    ),
                  ),
                  UserStateFailure(:final message) => Text(
                    message,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: ColorScheme.of(context).error,
                    ),
                  ),
                  UserStateSuccess(:final data) => _MenuDrawerHeader(
                    user: data,
                  ),
                },
              ),
            ),
          ),
          Divider(indent: Dimens.space24, endIndent: Dimens.space24),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(Dimens.space12),
              children: [
                for (final (index, menu) in MainMenu.values.indexed)
                  FadeSlideIn(
                    delay: Motion.stagger * index,
                    offset: Dimens.space12,
                    child: _MenuDrawerItem(
                      menu: menu,
                      isSelected: menu == selected,
                      onTap: () => _onTap(context, menu),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  void _onTap(BuildContext context, MainMenu menu) {
    onSelected(menu);
    final route = menu.route;
    if (route == null) {
      onLogoutPressed();
    } else {
      context.goNamed(route.name);
    }
  }
}
