part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(Register? data) = _Success;
  const factory RegisterState.failure(String message) = _Failure;
  const factory RegisterState.init() = _Init;
  const factory RegisterState.showHidePassword() = _ShowHidePassword;
}
