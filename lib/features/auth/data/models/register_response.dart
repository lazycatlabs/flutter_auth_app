import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response.freezed.dart';
part 'register_response.g.dart';

@freezed
class RegisterResponse with _$RegisterResponse {
  const factory RegisterResponse({
    @JsonKey(name: "diagnostic") Diagnostic? diagnostic,
    @JsonKey(name: "data") DataRegister? data,
  }) = _RegisterResponse;

  const RegisterResponse._();

  Register toEntity() => Register(message: diagnostic?.message ?? "");

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@freezed
class DataRegister with _$DataRegister {
  const factory DataRegister({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "verified") bool? verified,
    @JsonKey(name: "createdAt") String? createdAt,
    @JsonKey(name: "updatedAt") String? updatedAt,
  }) = _DataRegister;

  factory DataRegister.fromJson(Map<String, dynamic> json) =>
      _$DataRegisterFromJson(json);
}
