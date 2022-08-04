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
import 'register_cubit_test.mocks.dart';

@GenerateMocks([PostRegister])
void main() {
  late RegisterCubit registerCubit;
  late MockPostRegister mockPostRegister;
  late Register register;

  final registerParams = RegisterParams(
    email: "dummy@gmail.com",
    password: "dummyPassword",
  );

  const errorMessage = "Invalid data";

  /// Initialize data
  setUp(() async {
    await serviceLocator(isUnitTest: true);
    register =
        RegisterResponse.fromJson(json.decode(jsonReader(successRegisterPath)))
            .toEntity();
    mockPostRegister = MockPostRegister();
    registerCubit = RegisterCubit(mockPostRegister);
  });

  /// Dispose bloc
  tearDown(() {
    registerCubit.close();
  });

  /// Test init data should be loading
  test("Initial state should be RegisterStatus.loading", () {
    expect(registerCubit.state.status, RegisterStatus.loading);
  });

  blocTest<RegisterCubit, RegisterState>(
    "When repo success get data should be return RegisterState",
    build: () {
      when(
        mockPostRegister.call(registerParams),
      ).thenAnswer((_) async => Right(register));

      return registerCubit;
    },
    act: (RegisterCubit registerCubit) => registerCubit.register(
      registerParams,
    ),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const RegisterState(),
      RegisterState(status: RegisterStatus.success, register: register),
    ],
  );

  blocTest<RegisterCubit, RegisterState>(
    "When repo success get data should be return ServerFailure",
    build: () {
      when(mockPostRegister.call(registerParams))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return registerCubit;
    },
    act: (RegisterCubit registerCubit) => registerCubit.register(
      registerParams,
    ),
    expect: () => [
      const RegisterState(),
      const RegisterState(
        status: RegisterStatus.failure,
        message: errorMessage,
      ),
    ],
  );
}
