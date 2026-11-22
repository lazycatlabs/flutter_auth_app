import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUsers) : super(const UsersStateLoading());

  int currentPage = 1;
  int lastPage = 1;
  List<User> users = [];

  final GetUsers _getUsers;

  Future<void> refresh() async {
    /// reset data
    users = [];

    /// reset page
    currentPage = 1;
    lastPage = 1;

    /// fetch data
    await fetchUsers(UsersParams(page: currentPage));
  }

  Future<void> nextPage() async {
    if (currentPage < lastPage) {
      currentPage++;
      await fetchUsers(UsersParams(page: currentPage));
    }
  }

  Future<void> fetchUsers(UsersParams params) async {
    if (currentPage == 1) {
      emit(const UsersStateLoading());
    }

    final data = await _getUsers.call(params);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(UsersStateFailure(l.message ?? ''));
        } else if (l is NoDataFailure) {
          emit(const UsersStateEmpty());
        }
      },
      (r) {
        /// New list instance so the success state differs from the last one
        users = [...users, ...?r.users];
        currentPage = r.currentPage ?? 1;
        lastPage = r.lastPage ?? 1;

        emit(
          UsersStateSuccess(
            Users(currentPage: currentPage, lastPage: lastPage, users: users),
          ),
        );
      },
    );
  }
}

@freezed
sealed class UsersState with _$UsersState {
  const factory UsersState.loading() = UsersStateLoading;

  const factory UsersState.success(Users data) = UsersStateSuccess;

  const factory UsersState.failure(String message) = UsersStateFailure;

  const factory UsersState.empty() = UsersStateEmpty;
}
