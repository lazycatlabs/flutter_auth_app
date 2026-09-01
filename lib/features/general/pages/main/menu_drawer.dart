import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    required this.dataMenu,
    required this.currentIndex,
    required this.onLogoutPressed,
    super.key,
  });

  final List<DataHelper> dataMenu;
  final ValueChanged<int> currentIndex;
  final VoidCallback onLogoutPressed;

  @override
  Widget build(BuildContext context) => Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: context.widthInPercent(100),
          height: Dimens.header,
          padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
          color: ColorScheme.of(context).primary,
          child: SafeArea(
            child: BlocBuilder<UserCubit, UserState>(
              builder: (_, state) => switch (state) {
                UserStateLoading() => Loading(
                  color: ColorScheme.of(context).onPrimary,
                ),
                UserStateFailure(:final message) => Center(
                  child: Text(
                    message,
                    style: TextTheme.of(context).bodyMedium?.copyWith(
                      color: ColorScheme.of(context).onPrimary,
                    ),
                  ),
                ),
                UserStateSuccess(:final data) => Row(
                  spacing: Dimens.space12,
                  children: [
                    CircleImage(
                      url: data?.avatar ?? '',
                      size: Dimens.profilePicture,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${data?.name ?? ''} ${data?.isVerified ?? false ? '✅' : ''}',
                            style: TextTheme.of(context).titleLargeBold
                                ?.copyWith(
                                  color: ColorScheme.of(context).onPrimary,
                                ),
                          ),
                          Text(
                            data?.email ?? '',
                            style: TextTheme.of(context).bodySmall?.copyWith(
                              color: ColorScheme.of(context).onPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              },
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
                          if (value.title != null) {
                            currentIndex(dataMenu.indexOf(value));
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
                            style: TextTheme.of(context).bodyLarge,
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
