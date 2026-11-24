import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/users/users.dart';

class UsersRepositoryImpl implements UsersRepository {
  /// Data Source
  final UsersRemoteDatasource usersRemoteDatasource;

  const UsersRepositoryImpl(this.usersRemoteDatasource);

  @override
  Future<Either<Failure, Users>> users(UsersParams params) async =>
      (await usersRemoteDatasource.users(params)).then((response) {
        if (response.users?.isEmpty ?? true) {
          return Left(NoDataFailure());
        }
        final limit = response.limit ?? params.limit;
        final total = response.total ?? 0;
        return Right(
          Users(
            users: response.users
                ?.map(
                  (data) => User(
                    name: '${data.firstName ?? ''} ${data.lastName ?? ''}'
                        .trim(),
                    email: data.email,
                    avatar: data.image,
                  ),
                )
                .toList(),
            currentPage: limit == 0 ? 1 : (response.skip ?? 0) ~/ limit + 1,
            lastPage: limit == 0 ? 1 : (total / limit).ceil(),
          ),
        );
      });

  @override
  Future<Either<Failure, User>> user() async =>
      (await usersRemoteDatasource.user()).then((response) {
        final data = response.data;
        if (data == null) {
          return Left(NoDataFailure());
        }
        return Right(
          User(
            name: data.name,
            email: data.email,
            avatar: data.photo,
            isVerified: data.verified,
            updatedAt: data.updatedAt,
          ),
        );
      });
}
