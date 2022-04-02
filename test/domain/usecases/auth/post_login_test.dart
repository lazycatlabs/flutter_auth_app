import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';
import '../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostLogin postLogin;
  late Login login;
  final loginParams =
      LoginParams(email: 'test@gmail.com', password: 'password');

  setUp(() {
    login = LoginResponse.fromJson(json.decode(jsonReader(successLoginPath)))
        .toEntity();
    mockAuthRepository = MockAuthRepository();
    postLogin = PostLogin(mockAuthRepository);
  });

  test("should get login from the repository", () async {
    /// arrange
    when(mockAuthRepository.login(loginParams))
        .thenAnswer((_) async => Right(login));

    /// act
    final result = await postLogin.call(loginParams);

    /// assert
    expect(result, equals(Right(login)));
  });
}
