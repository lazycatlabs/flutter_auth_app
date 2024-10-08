import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockUsersRemoteDatasource mockUsersRemoteDatasource;
  late UsersRepositoryImpl authRepositoryImpl;
  late Users users;
  late User user;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'users_repository_impl_test_',
    );
    mockUsersRemoteDatasource = MockUsersRemoteDatasource();
    authRepositoryImpl = UsersRepositoryImpl(mockUsersRemoteDatasource);
    users = UsersResponse.fromJson(
      json.decode(jsonReader(pathUsersResponse200)) as Map<String, dynamic>,
    ).toEntity();
    user = UserResponse.fromJson(
      json.decode(jsonReader(pathUserResponse200)) as Map<String, dynamic>,
    ).toEntity();
  });

  group("users", () {
    const usersParams = UsersParams();
    const usersParamsEmpty = UsersParams(page: 3);

    test('should return list users when call data is successful', () async {
      // arrange
      when(mockUsersRemoteDatasource.users(usersParams)).thenAnswer(
        (_) async => Right(
          UsersResponse.fromJson(
            json.decode(jsonReader(pathUsersResponse200))
                as Map<String, dynamic>,
          ),
        ),
      );

      // act
      final result = await authRepositoryImpl.users(usersParams);

      // assert
      verify(mockUsersRemoteDatasource.users(usersParams));
      expect(result, equals(Right(users)));
    });

    test(
      'should return empty list users when call data is successful',
      () async {
        // arrange
        when(mockUsersRemoteDatasource.users(usersParamsEmpty)).thenAnswer(
          (_) async => Left(NoDataFailure()),
        );

        // act
        final result = await authRepositoryImpl.users(usersParamsEmpty);

        // assert
        verify(mockUsersRemoteDatasource.users(usersParamsEmpty));
        expect(result, equals(Left(NoDataFailure())));
      },
    );

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockUsersRemoteDatasource.users(usersParams))
            .thenAnswer((_) async => const Left(ServerFailure('')));

        // act
        final result = await authRepositoryImpl.users(usersParams);

        // assert
        verify(mockUsersRemoteDatasource.users(usersParams));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });

  group("user", () {
    test('should return list users when call data is successful', () async {
      // arrange
      when(mockUsersRemoteDatasource.user()).thenAnswer(
        (_) async => Right(
          UserResponse.fromJson(
            json.decode(jsonReader(pathUserResponse200))
                as Map<String, dynamic>,
          ),
        ),
      );

      // act
      final result = await authRepositoryImpl.user();

      // assert
      verify(mockUsersRemoteDatasource.user());
      expect(result, equals(Right(user)));
    });

    test(
      'should return empty list users when call data is successful',
      () async {
        // arrange
        when(mockUsersRemoteDatasource.user()).thenAnswer(
          (_) async => Left(NoDataFailure()),
        );

        // act
        final result = await authRepositoryImpl.user();

        // assert
        verify(mockUsersRemoteDatasource.user());
        expect(result, equals(Left(NoDataFailure())));
      },
    );

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockUsersRemoteDatasource.user())
            .thenAnswer((_) async => const Left(ServerFailure('')));

        // act
        final result = await authRepositoryImpl.user();

        // assert
        verify(mockUsersRemoteDatasource.user());
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });
}
