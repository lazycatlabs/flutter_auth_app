import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

@freezed
sealed class UsersResponse with _$UsersResponse {
  const factory UsersResponse({
    @JsonKey(name: 'diagnostic') Diagnostic? diagnostic,
    @JsonKey(name: 'data') List<DataUser>? data,
    @JsonKey(name: 'page') Page? page,
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

  factory UsersResponse.fromDummyJson(
    Map<String, dynamic> json, {
    required int currentPage,
  }) {
    final limit = (json['limit'] as num?)?.toInt() ?? 20;
    final total = (json['total'] as num?)?.toInt() ?? 0;
    final rawUsers = json['users'] as List<dynamic>? ?? const [];

    return UsersResponse(
      data: rawUsers.map((rawUser) {
        final user = rawUser as Map<String, dynamic>;
        final firstName = user['firstName'] as String? ?? '';
        final lastName = user['lastName'] as String? ?? '';

        return DataUser(
          id: user['id']?.toString(),
          name: '$firstName $lastName'.trim(),
          email: user['email'] as String?,
          photo: user['image'] as String?,
          verified: true,
        );
      }).toList(),
      page: Page(
        currentPage: currentPage,
        perPage: limit,
        lastPage: limit == 0 ? 1 : (total / limit).ceil(),
        total: total,
      ),
    );
  }
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
