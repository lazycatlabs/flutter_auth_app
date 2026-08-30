import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

abstract class UsersRemoteDatasource {
  Future<Either<Failure, UsersResponse>> users(UsersParams userParams);

  Future<Either<Failure, UserResponse>> user();
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  static const int _usersPerPage = 20;

  final DioClient _client;

  UsersRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, UsersResponse>> users(UsersParams userParams) async {
    final response = await _client.getRequest(
      ListAPI.users,
      queryParameters: {
        'limit': _usersPerPage,
        'skip': (userParams.page - 1) * _usersPerPage,
      },
      converter: (response) => UsersResponse.fromDummyJson(
        response as Map<String, dynamic>,
        currentPage: userParams.page,
      ),
      includeAuthorization: false,
    );

    return response;
  }

  @override
  Future<Either<Failure, UserResponse>> user() async {
    final response = await _client.getRequest(
      ListAPI.user,
      converter: (response) =>
          UserResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
