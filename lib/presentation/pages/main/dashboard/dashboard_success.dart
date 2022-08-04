import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';

class DashboardSuccess extends StatelessWidget {
  const DashboardSuccess({
    super.key,
    required this.currentPage,
    required this.lastPage,
    required this.users,
    required this.onRefresh,
    required this.controller,
  });
  final int currentPage;
  final int lastPage;
  final List<User> users;
  final ValueGetter<Future<void>> onRefresh;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Theme.of(context).iconTheme.color,
      onRefresh: onRefresh,
      child: ListView.builder(
        controller: controller,
        itemCount: currentPage == lastPage ? users.length : users.length + 1,
        padding: EdgeInsets.symmetric(vertical: Dimens.space16),
        itemBuilder: (_, index) {
          return index < users.length
              ? Container(
                  decoration: BoxDecorations.card.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: Dimens.space16,
                    horizontal: Dimens.space24,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: Dimens.space8,
                    horizontal: Dimens.space16,
                  ),
                  child: Row(
                    children: [
                      CircleImage(
                        url: users[index].avatar ?? "",
                        size: Dimens.profilePicture,
                      ),
                      const SpacerH(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            users[index].name ?? "",
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            users[index].email ?? "",
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Theme.of(context).hintColor,
                                    ),
                          ),
                        ],
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
      ),
    );
  }
}
