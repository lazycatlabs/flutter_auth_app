import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';

class PostLogout extends UseCase<String, NoParams> with MainBoxMixin {
  final AuthRepository _repo;

  PostLogout(this._repo);

  @override
  Future<Either<Failure, String>> call(NoParams _) async {
    final result = await _repo.logout();
    return await result.thenAsync((message) async {
      await logoutBox();
      return Right(message);
    });
  }
}
