import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_cubit.freezed.dart';
part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUser) : super(const _Loading());
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
      emit(const _Loading());
    }

    final data = await _getUser.call(usersParams);
    data.fold(
      (l) {
        if (l is ServerFailure) {
          emit(_Failure(l.message ?? ""));
        } else if (l is NoDataFailure) {
          emit(const _Empty());
        }
      },
      (r) => emit(_Success(r)),
    );
  }
}
