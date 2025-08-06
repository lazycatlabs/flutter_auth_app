import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final GetUser _getUser;

  UserCubit(this._getUser) : super(const UserStateLoading());

  Future<void> getUser() async {
    emit(const UserStateLoading());
    final data = await _getUser.call(NoParams());
    data.fold(
      (l) => emit(UserStateFailure((l as ServerFailure).message ?? '')),
      (r) => emit(UserStateSuccess(r)),
    );
  }
}
@freezed
sealed class UserState with _$UserState {
  const factory UserState.loading() = UserStateLoading;
  const factory UserState.failure(String message) = UserStateFailure;
  const factory UserState.success(User? data) = UserStateSuccess;
}
