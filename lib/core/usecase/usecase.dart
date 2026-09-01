import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';

abstract class UseCase<Result, Params> {
  Future<Either<Failure, Result>> call(Params params);
}

/// Class to handle when useCase don't need params
class NoParams {
  const NoParams();
}
