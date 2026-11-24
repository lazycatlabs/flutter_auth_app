import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  const AuthRepositoryImpl(this.authRemoteDatasource);

  @override
  Future<Either<Failure, Login>> login(LoginParams params) async =>
      (await authRemoteDatasource.login(params)).then((response) {
        final data = response.data;
        if (data == null) {
          return Left(NoDataFailure());
        }
        return Right(
          Login(
            token: '${data.tokenType} ${data.token}',
            refreshToken: '${data.tokenType} ${data.refreshToken}',
          ),
        );
      });

  @override
  Future<Either<Failure, Register>> register(RegisterParams params) async =>
      (await authRemoteDatasource.register(params)).map(
        (response) => Register(message: response.diagnostic?.message ?? ''),
      );

  @override
  Future<Either<Failure, GeneralToken>> generalToken(
    GeneralTokenParams params,
  ) async => (await authRemoteDatasource.generalToken(params)).then((response) {
    final data = response.data;
    if (data == null) {
      return Left(NoDataFailure());
    }
    return Right(GeneralToken(token: '${data.tokenType} ${data.token}'));
  });

  @override
  Future<Either<Failure, String>> logout() async =>
      (await authRemoteDatasource.logout()).map(
        (response) => response.diagnostic?.message ?? '',
      );
}
