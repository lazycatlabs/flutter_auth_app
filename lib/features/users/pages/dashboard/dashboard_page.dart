import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///*********************************************
/// Created by ukietux on 25/08/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final ScrollController _scrollController = ScrollController()
    ..addListener(() async {
      //coverage:ignore-start
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        context.read<UsersCubit>().nextPage();
      }
      //coverage:ignore-end
    });

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: RefreshIndicator(
        color: Theme.of(context).extension<LzyctColors>()!.pink,
        backgroundColor: Theme.of(context).extension<LzyctColors>()!.background,
        onRefresh: () => context.read<UsersCubit>().refresh(),
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (_, state) {
            return state.when(
              initial: () => const SizedBox.shrink(),
              //coverage:ignore-line
              loading: () => const Center(child: Loading()),
              success: (data) {
                return ListView.builder(
                  controller: _scrollController,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: data.currentPage == data.lastPage
                      ? data.users?.length //coverage:ignore-line
                      : ((data.users?.length ?? 0) + 1),
                  padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                  itemBuilder: (_, index) {
                    return index < (data.users?.length ?? 0)
                        ? userItem(data.users![index])
                        : Padding(
                            padding: EdgeInsets.all(Dimens.space16),
                            child: const Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          );
                  },
                );
              },
              failure: (message) => Center(child: Empty(errorMessage: message)),
              empty: () => const Center(child: Empty()),
            );
          },
        ),
      ),
    );
  }

  Container userItem(User user) {
    return Container(
      decoration: BoxDecorations(context).card,
      margin: EdgeInsets.symmetric(
        vertical: Dimens.space12,
        horizontal: Dimens.space16,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.space8),
              bottomLeft: Radius.circular(Dimens.space8),
            ),
            child: CachedNetworkImage(
              imageUrl: user.avatar ?? "",
              width: Dimens.profilePicture,
              height: Dimens.profilePicture,
              fit: BoxFit.cover,
            ),
          ),
          SpacerH(value: Dimens.space16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? "",
                  style: Theme.of(context).textTheme.titleLargeBold,
                ),
                Text(
                  user.email ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Theme.of(context).hintColor),
                ),
                const SpacerV(),
                Row(
                  children: [
                    Text(
                      Strings.of(context)!.lastUpdate,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: Theme.of(context).hintColor),
                    ),
                    Flexible(
                      child: Text(
                        (user.updatedAt ?? "").toStringDateAlt(),
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(color: Theme.of(context).hintColor),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
