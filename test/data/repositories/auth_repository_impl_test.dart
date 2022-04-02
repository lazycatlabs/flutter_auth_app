import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/paths.dart';
import '../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRemoteDatasource mockAuthRemoteDatasource;
  late AuthRepositoryImpl authRepositoryImpl;
  late Login login;
  late Register register;
  late Users users;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    mockAuthRemoteDatasource = MockAuthRemoteDatasource();
    authRepositoryImpl = AuthRepositoryImpl(mockAuthRemoteDatasource);
    login = LoginResponse.fromJson(json.decode(jsonReader(successLoginPath)))
        .toEntity();
    register =
        RegisterResponse.fromJson(json.decode(jsonReader(successRegisterPath)))
            .toEntity();
    users = UsersResponse.fromJson(json.decode(jsonReader(successUserPath)))
        .toEntity();
  });

  group("login", () {
    final loginParams = LoginParams(email: "email", password: "password");
    test('should return login when call data is successful', () async {
      // arrange
      when(mockAuthRemoteDatasource.login(loginParams)).thenAnswer(
        (_) async => LoginResponse.fromJson(
          json.decode(jsonReader(successLoginPath)),
        ),
      );

      // act
      final result = await authRepositoryImpl.login(loginParams);

      // assert
      verify(mockAuthRemoteDatasource.login(loginParams));
      expect(result, equals(Right(login)));
    });

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockAuthRemoteDatasource.login(loginParams))
            .thenThrow(ServerException(''));

        // act
        final result = await authRepositoryImpl.login(loginParams);

        // assert
        verify(mockAuthRemoteDatasource.login(loginParams));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });

  group("register", () {
    final registerParams = RegisterParams(email: "email", password: "password");
    test('should return register when call data is successful', () async {
      // arrange
      when(mockAuthRemoteDatasource.register(registerParams)).thenAnswer(
        (_) async => RegisterResponse.fromJson(
          json.decode(jsonReader(successRegisterPath)),
        ),
      );

      // act
      final result = await authRepositoryImpl.register(registerParams);

      // assert
      verify(mockAuthRemoteDatasource.register(registerParams));
      expect(result, equals(Right(register)));
    });

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockAuthRemoteDatasource.register(registerParams))
            .thenThrow(ServerException(''));

        // act
        final result = await authRepositoryImpl.register(registerParams);

        // assert
        verify(mockAuthRemoteDatasource.register(registerParams));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });

  group("user", () {
    final userParams = UsersParams();
    final userParamsEmpty = UsersParams(page: 3);

    test('should return list user when call data is successful', () async {
      // arrange
      when(mockAuthRemoteDatasource.users(userParams)).thenAnswer(
        (_) async =>
            UsersResponse.fromJson(json.decode(jsonReader(successUserPath))),
      );

      // act
      final result = await authRepositoryImpl.users(userParams);

      // assert
      verify(mockAuthRemoteDatasource.users(userParams));
      expect(result, equals(Right(users)));
    });

    test(
      'should return empty list user when call data is successful',
      () async {
        // arrange
        when(mockAuthRemoteDatasource.users(userParamsEmpty)).thenAnswer(
          (_) async => UsersResponse.fromJson(
            json.decode(jsonReader(emptyUserPath)),
          ),
        );

        // act
        final result = await authRepositoryImpl.users(userParamsEmpty);

        // assert
        verify(mockAuthRemoteDatasource.users(userParamsEmpty));
        expect(result, equals(Left(NoDataFailure())));
      },
    );

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockAuthRemoteDatasource.users(userParams))
            .thenThrow(ServerException(''));

        // act
        final result = await authRepositoryImpl.users(userParams);

        // assert
        verify(mockAuthRemoteDatasource.users(userParams));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });
}
