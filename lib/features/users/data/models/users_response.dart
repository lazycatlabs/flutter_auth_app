import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  const factory UsersResponse({
    @JsonKey(name: "diagnostic") Diagnostic? diagnostic,
    @JsonKey(name: "data") List<DataUser>? data,
    @JsonKey(name: "page") Page? page,
  }) = _UsersResponse;

  const UsersResponse._();

  Users toEntity() => Users(
        users: data
            ?.map(
              (data) => User(
                name: data.name,
                email: data.email,
                avatar: data.photo,
                isVerified: data.verified,
                updatedAt: data.updatedAt,
              ),
            )
            .toList(),
        currentPage: page?.currentPage,
        lastPage: page?.lastPage,
      );

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
}

@freezed
class DataUser with _$DataUser {
  const factory DataUser({
    @JsonKey(name: "id") String? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "photo") String? photo,
    @JsonKey(name: "verified") bool? verified,
    @JsonKey(name: "createdAt") String? createdAt,
    @JsonKey(name: "updatedAt") String? updatedAt,
  }) = _DataUser;

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);
}
