import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_cubit.freezed.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  late final ScrollController scrollController = ScrollController()
    ..addListener(() {
      scrollController.addListener(() async {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            if (currentPage < lastPage) {
              currentPage++;
              await fetchUsers(UsersParams(page: currentPage));
            }
          }
        }
      });
    });
  int currentPage = 1;
  int lastPage = 1;
  final List<User> users = [];

  UsersCubit(this._getUser) : super(const _Loading());
  final GetUsers _getUser;

  Future<void> refresh() async {
    /// reset data
    users.clear();

    /// reset page
    currentPage = 1;
    lastPage = 1;

    /// fetch data
    await fetchUsers(UsersParams(page: currentPage));
  }

  Future<void> fetchUsers(UsersParams usersParams) async {
    if (currentPage == 1) emit(const _Loading());

    final data = await _getUser.call(usersParams);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        } else if (l is NoDataFailure) {
          emit(const _Empty());
        }
      },
      (r) {
        users.addAll(r.users ?? []);
        currentPage = r.currentPage ?? 1;
        lastPage = r.lastPage ?? 1;

        emit(_Success(users));
      },
    );
  }
}
