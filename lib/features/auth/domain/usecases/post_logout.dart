import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';

class PostLogout extends UseCase<String, NoParams> with MainBoxMixin {
  final AuthRepository _repo;

  // coverage:ignore-start
  PostLogout(this._repo);

  @override
  Future<Either<Failure, String>> call(NoParams _) async {
    final result = await _repo.logout();
    return result.fold((failure) => Left(failure), (message) async {
      await logoutBox();
      return Right(message);
    });
  }

  // coverage:ignore-end
}
