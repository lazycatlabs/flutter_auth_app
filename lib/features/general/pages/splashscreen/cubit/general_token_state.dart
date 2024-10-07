part of 'general_token_cubit.dart';

@freezed
class GeneralTokenState with _$GeneralTokenState {
  const factory GeneralTokenState.loading() = _Loading;

  const factory GeneralTokenState.success(String? data) = _Success;

  const factory GeneralTokenState.failure(String message) = _Failure;
}
