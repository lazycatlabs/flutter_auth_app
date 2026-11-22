import 'package:either_dart/either.dart';
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
  Future<Either<Failure, RegisterResponse>> register(RegisterParams params) =>
      _client.postRequest(
        ListAPI.user,
        data: params.toJson(),
        converter: (response) =>
            RegisterResponse.fromJson(response as Map<String, dynamic>),
      );

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams params) =>
      _client.postRequest(
        ListAPI.login,
        data: params.toJson(),
        converter: (response) =>
            LoginResponse.fromJson(response as Map<String, dynamic>),
      );

  @override
  Future<Either<Failure, GeneralTokenResponse>> generalToken(
    GeneralTokenParams params,
  ) => _client.postRequest(
    ListAPI.generalToken,
    data: params.toJson(),
    converter: (response) =>
        GeneralTokenResponse.fromJson(response as Map<String, dynamic>),
    includeAuthorization: false,
  );

  @override
  Future<Either<Failure, DiagnosticResponse>> logout() => _client.postRequest(
    ListAPI.logout,
    converter: (response) =>
        DiagnosticResponse.fromJson(response as Map<String, dynamic>),
  );
}
