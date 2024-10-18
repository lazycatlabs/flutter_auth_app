import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostRegister postRegister;
  late Register register;
  const registerParams = RegisterParams(
    name: "Mudassir",
    email: 'mudassir@lazycatlabs.com',
    password: 'pass123',
  );

  setUp(() {
    register = RegisterResponse.fromJson(
      json.decode(jsonReader(pathRegisterResponse200)) as Map<String, dynamic>,
    ).toEntity();
    mockAuthRepository = MockAuthRepository();
    postRegister = PostRegister(mockAuthRepository);
  });

  test("should get register from the repository", () async {
    /// arrange
    when(mockAuthRepository.register(registerParams))
        .thenAnswer((_) async => Right(register));

    /// act
    final result = await postRegister.call(registerParams);

    /// assert
    expect(result, equals(Right(register)));
  });

  test("parse RegisterParams to json", () {
    /// act
    final result = registerParams.toJson();
    final expected = {
      "name": "Mudassir",
      "email": "mudassir@lazycatlabs.com",
      "password": "pass123",
    };

    /// assert
    expect(result, equals(expected));
  });

  test("parse RegisterParams from json", () {
    /// act
    final params = RegisterParams.fromJson({
      "name": "Mudassir",
      "email": "mudassir@lazycatlabs.com",
      "password": "pass123",
    });

    /// assert
    expect(params, equals(registerParams));
  });
}
