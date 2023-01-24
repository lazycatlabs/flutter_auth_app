import 'package:flutter_auth_app/features/users/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

@freezed
class UsersResponse with _$UsersResponse {
  const factory UsersResponse({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    List<DataUser>? data,
    SupportUser? support,
    String? error,
  }) = _UsersResponse;

  const UsersResponse._();

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Users toEntity() {
    final listUser = data!
        .map<User>(
          (model) => User(
            name: "${model.firstName} ${model.lastName}",
            avatar: model.avatar ?? "",
            email: model.email ?? "",
          ),
        )
        .toList();

    return Users(
      users: listUser,
      currentPage: page ?? 1,
      lastPage: totalPages ?? 1,
    );
  }
}

@freezed
class SupportUser with _$SupportUser {
  const factory SupportUser({
    String? url,
    String? text,
  }) = _SupportUser;

  factory SupportUser.fromJson(Map<String, dynamic> json) =>
      _$SupportUserFromJson(json);
}

@freezed
class DataUser with _$DataUser {
  const factory DataUser({
    int? id,
    String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? avatar,
  }) = _DataUser;

  factory DataUser.fromJson(Map<String, dynamic> json) =>
      _$DataUserFromJson(json);
}
