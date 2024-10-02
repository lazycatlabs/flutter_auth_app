import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/utils/services/hive/hive.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    final response = await authRemoteDatasource.login(params);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(
          MainBoxKeys.authToken,
          "${loginResponse.data?.tokenType} ${loginResponse.data?.token}",
        );

        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, Register>> register(RegisterParams params) async {
    final response = await authRemoteDatasource.register(params);

    return response.fold(
      (failure) => Left(failure),
      (registerResponse) {
        return Right(registerResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, GeneralToken>> generalToken(
    GeneralTokenParams params,
  ) async {
    final response = await authRemoteDatasource.generalToken(params);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(
          MainBoxKeys.generalToken,
          "${loginResponse.data?.tokenType} ${loginResponse.data?.token}",
        );

        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, String>> logout() async {
    final response = await authRemoteDatasource.logout();

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) => Right(loginResponse.diagnostic?.message ?? ""),
    );
  }
}
