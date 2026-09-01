import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/features/users/data/models/users_response.dart';
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
