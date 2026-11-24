import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_users.freezed.dart';
part 'get_users.g.dart';

class GetUsers extends UseCase<Users, UsersParams> {
  final UsersRepository _repo;

  GetUsers(this._repo);

  @override
  Future<Either<Failure, Users>> call(UsersParams params) =>
      _repo.users(params);
}

@freezed
sealed class UsersParams with _$UsersParams {
  const factory UsersParams({
    /// UI-only, 1-based; sent to DummyJSON as `skip`
    @JsonKey(includeToJson: false, includeFromJson: false) @Default(1) int page,
    @JsonKey(name: 'limit') @Default(20) int limit,
  }) = _UsersParams;

  const UsersParams._();

  factory UsersParams.fromJson(Map<String, dynamic> json) =>
      _$UsersParamsFromJson(json);

  @JsonKey(name: 'skip', includeToJson: true)
  int get skip => (page - 1) * limit;
}
