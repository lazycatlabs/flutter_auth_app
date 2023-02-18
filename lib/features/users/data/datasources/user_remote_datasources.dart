import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

abstract class UsersRemoteDatasource {
  Future<Either<Failure, UsersResponse>> users(UsersParams userParams);
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  final DioClient _client;

  UsersRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, UsersResponse>> users(UsersParams userParams) async {
    final response = await _client.getRequest(
      ListAPI.users,
      queryParameters: userParams.toJson(),
      converter: (response) =>
          UsersResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
