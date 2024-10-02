import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, RegisterResponse>> register(RegisterParams params);

  Future<Either<Failure, LoginResponse>> login(LoginParams params);

  Future<Either<Failure, GeneralTokenResponse>> generalToken(
    GeneralTokenParams params,
  );

  Future<Either<Failure, DiagnosticResponse>> logout();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, RegisterResponse>> register(
    RegisterParams params,
  ) async {
    final response = await _client.postRequest(
      ListAPI.user,
      data: params.toJson(),
      converter: (response) =>
          RegisterResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams params) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: params.toJson(),
      converter: (response) =>
          LoginResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, GeneralTokenResponse>> generalToken(
    GeneralTokenParams params,
  ) async {
    final response = await _client.postRequest(
      ListAPI.generalToken,
      data: params.toJson(),
      converter: (response) =>
          GeneralTokenResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }

  @override
  Future<Either<Failure, DiagnosticResponse>> logout() async {
    final response = await _client.postRequest(
      ListAPI.logout,
      converter: (response) =>
          DiagnosticResponse.fromJson(response as Map<String, dynamic>),
    );

    return response;
  }
}
