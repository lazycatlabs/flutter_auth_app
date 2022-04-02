import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  /// ignore: avoid_unused_constructor_parameters
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String? message;

  const ServerFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class NoDataFailure extends Failure {
  @override
  List<Object?> get props => [""];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [""];
}
