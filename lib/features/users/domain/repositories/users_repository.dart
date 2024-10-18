import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

abstract class UsersRepository {
  Future<Either<Failure, Users>> users(UsersParams usersParams);

  Future<Either<Failure, User>> user();
}
