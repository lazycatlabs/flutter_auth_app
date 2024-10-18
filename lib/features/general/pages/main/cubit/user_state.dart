part of 'user_cubit.dart';

@freezed
class UserState with _$UserState {
  const factory UserState.loading() = _Loading;
  const factory UserState.failure(String message) = _Failure;
  const factory UserState.success(User? data) = _Success;
}
