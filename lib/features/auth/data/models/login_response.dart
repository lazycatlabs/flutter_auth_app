import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: "diagnostic") Diagnostic? diagnostic,
    @JsonKey(name: "data") DataLogin? data,
  }) = _LoginResponse;

  const LoginResponse._();

  Login toEntity() => Login(token: "${data?.tokenType} ${data?.token}");

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
class DataLogin with _$DataLogin {
  const factory DataLogin({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "tokenType") String? tokenType,
  }) = _DataLogin;

  factory DataLogin.fromJson(Map<String, dynamic> json) =>
      _$DataLoginFromJson(json);
}
