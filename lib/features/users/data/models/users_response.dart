import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_response.freezed.dart';
part 'users_response.g.dart';

/// DummyJSON `GET /users` payload.
@freezed
sealed class UsersResponse with _$UsersResponse {
  const factory UsersResponse({
    @JsonKey(name: 'users') List<DataUsersItem>? users,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'skip') int? skip,
    @JsonKey(name: 'limit') int? limit,
  }) = _UsersResponse;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);
}

@freezed
sealed class DataUsersItem with _$DataUsersItem {
  const factory DataUsersItem({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'image') String? image,
  }) = _DataUsersItem;

  factory DataUsersItem.fromJson(Map<String, dynamic> json) =>
      _$DataUsersItemFromJson(json);
}
