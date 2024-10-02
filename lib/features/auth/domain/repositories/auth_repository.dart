import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams params);

  Future<Either<Failure, Register>> register(RegisterParams params);

  Future<Either<Failure, GeneralToken>> generalToken(GeneralTokenParams params);

  Future<Either<Failure, String>> logout();
}
