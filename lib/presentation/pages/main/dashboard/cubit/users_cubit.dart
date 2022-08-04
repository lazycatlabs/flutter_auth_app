import 'package:equatable/equatable.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUser) : super(const UsersState());
  final GetUsers _getUser;

  Future<void> fetchUsers(UsersParams userParams) async {
    /// Only show loading in 1 page
    await _fetchData(userParams);
  }

  Future<void> refreshUsers(UsersParams usersParams) async {
    await _fetchData(usersParams);
  }

  Future<void> _fetchData(UsersParams usersParams) async {
    if (usersParams.page == 1) {
      emit(state.copyWith(status: UsersStatus.loading));
    }

    final data = await _getUser.call(usersParams);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(state.copyWith(status: UsersStatus.failure, message: l.message));
        } else if (l is NoDataFailure) {
          emit(state.copyWith(status: UsersStatus.empty));
        }
      },
      (r) => emit(state.copyWith(status: UsersStatus.success, users: r)),
    );
  }
}
