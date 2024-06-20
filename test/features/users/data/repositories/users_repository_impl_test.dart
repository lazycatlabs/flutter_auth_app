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
      json.decode(jsonReader(successUserPath)) as Map<String, dynamic>,
    ).toEntity();
  });

  group("user", () {
    const userParams = UsersParams();
    const userParamsEmpty = UsersParams(page: 3);

    test('should return list user when call data is successful', () async {
      // arrange
      when(mockUsersRemoteDatasource.users(userParams)).thenAnswer(
        (_) async => Right(
          UsersResponse.fromJson(
            json.decode(jsonReader(successUserPath)) as Map<String, dynamic>,
          ),
        ),
      );

      // act
      final result = await authRepositoryImpl.users(userParams);

      // assert
      verify(mockUsersRemoteDatasource.users(userParams));
      expect(result, equals(Right(users)));
    });

    test(
      'should return empty list user when call data is successful',
      () async {
        // arrange
        when(mockUsersRemoteDatasource.users(userParamsEmpty)).thenAnswer(
          (_) async => Left(NoDataFailure()),
        );

        // act
        final result = await authRepositoryImpl.users(userParamsEmpty);

        // assert
        verify(mockUsersRemoteDatasource.users(userParamsEmpty));
        expect(result, equals(Left(NoDataFailure())));
      },
    );

    test(
      'should return server failure when call data is unsuccessful',
      () async {
        // arrange
        when(mockUsersRemoteDatasource.users(userParams))
            .thenAnswer((_) async => const Left(ServerFailure('')));

        // act
        final result = await authRepositoryImpl.users(userParams);

        // assert
        verify(mockUsersRemoteDatasource.users(userParams));
        expect(result, equals(const Left(ServerFailure(''))));
      },
    );
  });
}
