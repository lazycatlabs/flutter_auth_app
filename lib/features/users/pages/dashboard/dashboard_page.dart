import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_empty.dart';
part 'dashboard_loading.dart';
part 'dashboard_user_item.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late final ScrollController _scrollController = ScrollController()
    ..addListener(() {
      //coverage:ignore-start
      if (_scrollController.position.atEdge &&
          _scrollController.position.pixels != 0) {
        context.read<UsersCubit>().nextPage();
      }
      //coverage:ignore-end
    });

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Parent(
    child: RefreshIndicator(
      color: ColorScheme.of(context).primary,
      backgroundColor: ColorScheme.of(context).surface,
      onRefresh: () => context.read<UsersCubit>().refresh(),
      child: BlocBuilder<UsersCubit, UsersState>(
        builder: (_, state) => switch (state) {
          UsersStateLoading() => const _DashboardLoading(),
          UsersStateInitial() => const SizedBox.shrink(),
          UsersStateSuccess(:final data) => ListView.builder(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: data.currentPage == data.lastPage
                ? data
                      .users
                      ?.length //coverage:ignore-line
                : ((data.users?.length ?? 0) + 1),
            padding: EdgeInsets.symmetric(vertical: Dimens.space16),
            itemBuilder: (_, index) => index < (data.users?.length ?? 0)
                ? _DashboardUserItem(user: data.users![index])
                : Padding(
                    padding: EdgeInsets.all(Dimens.space16),
                    child: const Center(child: CupertinoActivityIndicator()),
                  ),
          ),
          UsersStateFailure(:final message) => _DashboardEmpty(
            message: message,
          ),
          UsersStateEmpty() => const _DashboardEmpty(),
        },
      ),
    ),
  );
}
