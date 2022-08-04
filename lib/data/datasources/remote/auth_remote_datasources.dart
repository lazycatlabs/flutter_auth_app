import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/domain/domain.dart';

abstract class AuthRemoteDatasource {
  Future<RegisterResponse> register(RegisterParams registerParams);

  Future<LoginResponse> login(LoginParams loginParams);

  Future<UsersResponse> users(UsersParams userParams);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<RegisterResponse> register(
    RegisterParams registerParams,
  ) async {
    try {
      final response = await _client.postRequest(
        ListApi.register,
        data: registerParams.toJson(),
      );

      final result = RegisterResponse.fromJson(response.data);
      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try {
      final response = await _client.postRequest(
        ListApi.login,
        data: loginParams.toJson(),
      );
      final result = LoginResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        return result;
      } else {
        throw ServerException(result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UsersResponse> users(UsersParams userParams) async {
    try {
      final response = await _client.getRequest(
        ListApi.users,
        queryParameters: userParams.toJson(),
      );
      final result = UsersResponse.fromJson(response.data);

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
