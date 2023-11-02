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
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  int _lastPage = 1;
  final List<User> _users = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          if (_currentPage < _lastPage) {
            _currentPage++;
            await context
                .read<UsersCubit>()
                .fetchUsers(UsersParams(page: _currentPage));
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: RefreshIndicator(
        color: Theme.of(context).extension<LzyctColors>()!.pink,
        backgroundColor: Theme.of(context).extension<LzyctColors>()!.background,
        onRefresh: () {
          _currentPage = 1;
          _lastPage = 1;
          _users.clear();

          return context
              .read<UsersCubit>()
              .refreshUsers(UsersParams(page: _currentPage));
        },
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (_, state) {
            return state.when(
              loading: () => const Center(child: Loading()),
              success: (data) {
                _users.addAll(data.users ?? []);
                _lastPage = data.lastPage ?? 1;

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: _currentPage == _lastPage
                      ? _users.length
                      : _users.length + 1,
                  padding: EdgeInsets.symmetric(vertical: Dimens.space16),
                  itemBuilder: (_, index) {
                    return index < _users.length
                        ? Container(
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
                                    imageUrl: _users[index].avatar ?? "",
                                    width: Dimens.profilePicture,
                                    height: Dimens.profilePicture,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SpacerH(value: Dimens.space16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _users[index].name ?? "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLargeBold,
                                      ),
                                      Text(
                                        _users[index].email ?? "",
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
                          )
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
}
