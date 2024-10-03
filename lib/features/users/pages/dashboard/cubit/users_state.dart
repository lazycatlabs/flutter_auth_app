part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.loading() = _Loading;
  const factory UsersState.initial() = _Initial;
  const factory UsersState.success(Users data) = _Success;
  const factory UsersState.failure(String message) = _Failure;
  const factory UsersState.empty() = _Empty;
}
