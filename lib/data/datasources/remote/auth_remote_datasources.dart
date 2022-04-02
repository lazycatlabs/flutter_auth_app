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
      final _response = await _client.postRequest(
        ListApi.register,
        data: registerParams.toJson(),
      );

      final _result = RegisterResponse.fromJson(_response.data);
      if (_response.statusCode == 200) {
        return _result;
      } else {
        throw ServerException(_result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<LoginResponse> login(LoginParams loginParams) async {
    try {
      final _response = await _client.postRequest(
        ListApi.login,
        data: loginParams.toJson(),
      );
      final _result = LoginResponse.fromJson(_response.data);

      if (_response.statusCode == 200) {
        return _result;
      } else {
        throw ServerException(_result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<UsersResponse> users(UsersParams userParams) async {
    try {
      final _response = await _client.getRequest(
        ListApi.users,
        queryParameters: userParams.toJson(),
      );
      final _result = UsersResponse.fromJson(_response.data);

      if (_response.statusCode == 200) {
        return _result;
      } else {
        throw ServerException(_result.error);
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }
}
