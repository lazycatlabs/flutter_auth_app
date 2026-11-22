import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

abstract class UsersRemoteDatasource {
  Future<Either<Failure, UsersResponse>> users(UsersParams params);

  Future<Either<Failure, UserResponse>> user();
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  final DioClient _client;
  final DioClientDummyJson _clientDummyJson;

  UsersRemoteDatasourceImpl(this._client, this._clientDummyJson);

  @override
  Future<Either<Failure, UsersResponse>> users(UsersParams params) =>
      _clientDummyJson.getRequest(
        ListAPI.users,
        queryParameters: params.toJson(),
        converter: (response) =>
            UsersResponse.fromJson(response as Map<String, dynamic>),
        includeAuthorization: false,
      );

  @override
  Future<Either<Failure, UserResponse>> user() => _client.getRequest(
    ListAPI.user,
    converter: (response) =>
        UserResponse.fromJson(response as Map<String, dynamic>),
  );
}
