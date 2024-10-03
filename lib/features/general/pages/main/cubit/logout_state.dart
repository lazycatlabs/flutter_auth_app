part of 'logout_cubit.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.loading() = _Loading;
  const factory LogoutState.failure(String message) = _Failure;
  const factory LogoutState.success(String message) = _Success;
}
