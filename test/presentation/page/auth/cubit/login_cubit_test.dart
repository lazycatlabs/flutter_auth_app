import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import 'login_cubit_test.mocks.dart';

@GenerateMocks([PostLogin])
void main() {
  late LoginCubit loginCubit;
  late Login login;
  late MockPostLogin mockPostLogin;

  final loginParams = LoginParams(
    email: "dummy@gmail.com",
    password: "dummyPassword",
  );
  const errorMessage = "Wrong username or password";

  /// Initialize data
  setUp(() async {
    await serviceLocator(isUnitTest: true);
    login = LoginResponse.fromJson(
      json.decode(jsonReader(successLoginPath)),
    ).toEntity();
    mockPostLogin = MockPostLogin();
    loginCubit = LoginCubit(mockPostLogin);
  });

  /// Dispose bloc
  tearDown(() {
    loginCubit.close();
  });

  ///  Initial data should be loading
  test("Initial data should be LoginStatus.loading", () {
    expect(loginCubit.state.status, LoginStatus.loading);
  });

  blocTest<LoginCubit, LoginState>(
    "When repo success get data should be return LoginState",
    build: () {
      when(mockPostLogin.call(loginParams))
          .thenAnswer((_) async => Right(login));

      return loginCubit;
    },
    act: (cubit) => cubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoginState(),
      LoginState(status: LoginStatus.success, login: login),
    ],
  );

  blocTest<LoginCubit, LoginState>(
    "When user input wrong credential should be return ServerFailure",
    build: () {
      when(mockPostLogin.call(loginParams))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return loginCubit;
    },
    act: (LoginCubit loginCubit) => loginCubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LoginState(),
      const LoginState(status: LoginStatus.failure, message: errorMessage),
    ],
  );
}
