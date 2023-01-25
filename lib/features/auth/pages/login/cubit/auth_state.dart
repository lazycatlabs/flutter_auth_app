part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;
  const factory AuthState.success(String? data) = _Success;
  const factory AuthState.failure(String message) = _Failure;
}
