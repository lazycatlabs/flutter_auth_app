import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

class UsersRepositoryImpl implements UsersRepository {
  /// Data Source
  final UsersRemoteDatasource usersRemoteDatasource;

  const UsersRepositoryImpl(this.usersRemoteDatasource);

  @override
  Future<Either<Failure, Users>> users(UsersParams usersParams) async {
    final response = await usersRemoteDatasource.users(usersParams);

    return response.fold(
      (failure) => Left(failure),
      (usersResponse) {
        if (usersResponse.data?.isEmpty ?? true) {
          return Left(NoDataFailure()); //coverage:ignore-line
        }
        return Right(usersResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, User>> user() async {
    final response = await usersRemoteDatasource.user();

    return response.fold(
      (failure) => Left(failure),
      (userResponse) => Right(userResponse.toEntity()),
    );
  }
}
