import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    final response = await authRemoteDatasource.login(params);

    return response.fold((failure) => Left(failure), (loginResponse) {
      if (loginResponse.data == null) {
        return Left(NoDataFailure());
      }
      return Right(
        Login(
          token:
              '${loginResponse.data?.tokenType} ${loginResponse.data?.token}',
          refreshToken:
              '${loginResponse.data?.tokenType} ${loginResponse.data?.refreshToken}',
        ),
      );
    });
  }

  @override
  Future<Either<Failure, Register>> register(RegisterParams params) async {
    final response = await authRemoteDatasource.register(params);

    return response.fold(
      (failure) => Left(failure),
      (registerResponse) =>
          Right(Register(message: registerResponse.diagnostic?.message ?? '')),
    );
  }

  @override
  Future<Either<Failure, GeneralToken>> generalToken(
    GeneralTokenParams params,
  ) async {
    final response = await authRemoteDatasource.generalToken(params);

    return response.fold((failure) => Left(failure), (tokenResponse) {
      if (tokenResponse.data == null) {
        return Left(NoDataFailure());
      }
      return Right(
        GeneralToken(
          token:
              '${tokenResponse.data?.tokenType} ${tokenResponse.data?.token}',
        ),
      );
    });
  }

  @override
  Future<Either<Failure, String>> logout() async {
    final response = await authRemoteDatasource.logout();

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) => Right(loginResponse.diagnostic?.message ?? ''),
    );
  }
}
