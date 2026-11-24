import 'package:flutter_auth_app/features/general/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

@freezed
sealed class UserResponse with _$UserResponse {
  const factory UserResponse({
    @JsonKey(name: 'diagnostic') Diagnostic? diagnostic,
    @JsonKey(name: 'data') DataUser? data,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

@freezed
sealed class DataUser with _$DataUser {
  const factory DataUser({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'photo') String? photo,
    @JsonKey(name: 'verified') bool? verified,
    @JsonKey(name: 'createdAt') String? createdAt,
    @JsonKey(name: 'updatedAt') String? updatedAt,
  }) = _DataUser;

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);
}
