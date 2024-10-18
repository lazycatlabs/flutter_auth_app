import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';

class PostLogout extends UseCase<String, NoParams> {
  final AuthRepository _repo;

// coverage:ignore-start
  PostLogout(this._repo);

  @override
  Future<Either<Failure, String>> call(NoParams _) => _repo.logout();
// coverage:ignore-end
}
