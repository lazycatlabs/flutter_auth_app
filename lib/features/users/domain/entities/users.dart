import 'package:freezed_annotation/freezed_annotation.dart';

part 'users.freezed.dart';

@freezed
sealed class Users with _$Users {
  const factory Users({
    List<User>? users,
    int? currentPage,
    int? lastPage,
  }) = _Users;
}

@freezed
sealed class User with _$User {
  const factory User({
    String? name,
    String? avatar,
    String? email,
    bool? isVerified,
    String? updatedAt,
  }) = _User;
}
