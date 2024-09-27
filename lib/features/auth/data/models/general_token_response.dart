import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_token_response.freezed.dart';
part 'general_token_response.g.dart';

@freezed
class GeneralTokenResponse with _$GeneralTokenResponse {
  const factory GeneralTokenResponse({
    @JsonKey(name: "diagnostic") Diagnostic? diagnostic,
    @JsonKey(name: "data") DataGeneralToken? data,
  }) = _GeneralTokenResponse;

  const GeneralTokenResponse._();

  GeneralToken toEntity() => GeneralToken(token: "${data?.tokenType} ${data?.token}");

  factory GeneralTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralTokenResponseFromJson(json);
}

@freezed
class DataGeneralToken with _$DataGeneralToken {
  const factory DataGeneralToken({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "tokenType") String? tokenType,
  }) = _DataGeneralToken;

  factory DataGeneralToken.fromJson(Map<String, dynamic> json) =>
      _$DataGeneralTokenFromJson(json);
}
