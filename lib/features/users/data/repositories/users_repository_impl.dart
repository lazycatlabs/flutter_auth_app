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

    return response.fold((failure) => Left(failure), (usersResponse) {
      if (usersResponse.data?.isEmpty ?? true) {
        return Left(NoDataFailure()); //coverage:ignore-line
      }
      return Right(
        Users(
          users: usersResponse.data
              ?.map(
                (data) => User(
                  name: data.name,
                  email: data.email,
                  avatar: data.photo,
                  isVerified: data.verified,
                  updatedAt: data.updatedAt,
                ),
              )
              .toList(),
          currentPage: usersResponse.page?.currentPage,
          lastPage: usersResponse.page?.lastPage,
        ),
      );
    });
  }

  @override
  Future<Either<Failure, User>> user() async {
    final response = await usersRemoteDatasource.user();

    return response.fold((failure) => Left(failure), (userResponse) {
      if (userResponse.data == null) {
        return Left(NoDataFailure());
      }
      return Right(
        User(
          name: userResponse.data?.name,
          email: userResponse.data?.email,
          avatar: userResponse.data?.photo,
          isVerified: userResponse.data?.verified,
          updatedAt: userResponse.data?.updatedAt,
        ),
      );
    });
  }
}
