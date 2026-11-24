import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:mockito/mockito.dart';

/// Runs before every test file. either_dart's `Either` is sealed, so mockito
/// cannot fake it: every `Either<Failure, T>` a mock returns needs a dummy.
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  void dummy<T>() => provideDummy<Either<Failure, T>>(Left(NoDataFailure()));

  dummy<GeneralTokenResponse>();
  dummy<LoginResponse>();
  dummy<RegisterResponse>();
  dummy<DiagnosticResponse>();
  dummy<UsersResponse>();
  dummy<UserResponse>();
  dummy<GeneralToken>();
  dummy<Login>();
  dummy<Register>();
  dummy<String>();
  dummy<Users>();
  dummy<User>();

  await testMain();
}
