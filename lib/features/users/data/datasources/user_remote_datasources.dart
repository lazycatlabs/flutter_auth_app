import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

abstract class UsersRemoteDatasource {
  Future<UsersResponse> users(UsersParams userParams);
}

class UsersRemoteDatasourceImpl implements UsersRemoteDatasource {
  final DioClient _client;

  UsersRemoteDatasourceImpl(this._client);

  @override
  Future<UsersResponse> users(UsersParams userParams) async {
    try {
      final response = await _client.getRequest(
        ListAPI.users,
        queryParameters: userParams.toJson(),
      );
      final result =
          UsersResponse.fromJson(response.data as Map<String, dynamic>);

      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
