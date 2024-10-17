import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: context.widthInPercent(100),
            height: Dimens.header,
            padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
            color: Theme.of(context).extension<LzyctColors>()!.banner,
            child: SafeArea(
              child: BlocBuilder<UserCubit, UserState>(
                builder: (_, state) => state.when(
                  loading: () => const Loading(),
                  failure: (message) => Center(child: Text(message)),
                  success: (data) => Row(
                    children: [
                      CircleImage(
                        url: data?.avatar ?? "",
                        size: Dimens.profilePicture,
                      ),
                      const SpacerH(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${data?.name ?? ""} ${data?.isVerified ?? false ? "✅" : ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLargeBold
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .extension<LzyctColors>()!
                                        .subtitle,
                                  ),
                            ),
                            Text(
                              data?.email ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .extension<LzyctColors>()!
                                        .subtitle,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SpacerV(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: dataMenu
                    .map<Widget>(
                      (value) => SizedBox(
                        width: double.maxFinite,
                        child: InkWell(
                          onTap: () {
                            for (final menu in dataMenu) {
                              menu.isSelected = menu.title == value.title;

                              if (value.title != null) {
                                currentIndex(dataMenu.indexOf(value));
                              }
                            }

                            _selectedPage(context, value.title!);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: Dimens.space12,
                              horizontal: Dimens.space24,
                            ),
                            child: Text(
                              value.title!,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ), //
          const SpacerH(),
        ],
      ),
    );
  }

  void _selectedPage(BuildContext context, String title) {
    //Update page from selected Page
    if (title == Strings.of(context)!.settings) {
      context.goNamed(Routes.settings.name);
    } else if (title == Strings.of(context)!.dashboard) {
      context.goNamed(Routes.dashboard.name);
    } else if (title == Strings.of(context)!.logout) {
      onLogoutPressed.call();
    }
  }
}
