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

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';
import 'users_cubit_test.mocks.dart';

@GenerateMocks([GetUsers])
void main() {
  late UsersCubit userCubit;
  late MockGetUsers mockGetUsers;
  late Users users;

  final dummyUsersRequest1 = UsersParams();
  final dummyUsersRequest2 = UsersParams(page: 2);
  const errorMessage = "";

  /// Initialize data
  setUp(() async {
    await serviceLocator(isUnitTest: true);

    users = UsersResponse.fromJson(json.decode(jsonReader(successUserPath)))
        .toEntity();
    mockGetUsers = MockGetUsers();
    userCubit = UsersCubit(mockGetUsers);
  });

  /// Dispose bloc
  tearDown(() {
    userCubit.close();
  });

  ///  Initial data should be loading
  test("Initial data should be UsersStatus.loading", () {
    expect(userCubit.state.status, UsersStatus.loading);
  });

  blocTest<UsersCubit, UsersState>(
    "When repo success get data should be return UsersState and loading only show when request page 1",
    build: () {
      when(mockGetUsers.call(dummyUsersRequest1))
          .thenAnswer((_) async => Right(users));

      return userCubit;
    },
    act: (UsersCubit usersCubit) => usersCubit.fetchUsers(dummyUsersRequest1),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const UsersState(),
      UsersState(status: UsersStatus.success, users: users),
    ],
  );

  blocTest<UsersCubit, UsersState>(
    "When request page 2, isLoading should not execute",
    build: () {
      when(mockGetUsers.call(dummyUsersRequest2))
          .thenAnswer((_) async => Right(users));

      return userCubit;
    },
    act: (UsersCubit usersCubit) => usersCubit.fetchUsers(dummyUsersRequest2),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      UsersState(status: UsersStatus.success, users: users),
    ],
  );

  blocTest<UsersCubit, UsersState>(
    "When failed to get data from server",
    build: () {
      when(
        mockGetUsers.call(dummyUsersRequest1),
      ).thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return UsersCubit(mockGetUsers);
    },
    act: (UsersCubit usersCubit) => usersCubit.fetchUsers(dummyUsersRequest1),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const UsersState(),
      const UsersState(status: UsersStatus.failure, message: errorMessage),
    ],
  );

  blocTest<UsersCubit, UsersState>(
    "When no data from server",
    build: () {
      when(mockGetUsers.call(dummyUsersRequest2))
          .thenAnswer((_) async => Left(NoDataFailure()));

      return UsersCubit(mockGetUsers);
    },
    act: (UsersCubit usersCubit) => usersCubit.fetchUsers(dummyUsersRequest2),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const UsersState(status: UsersStatus.empty),
    ],
  );

  blocTest<UsersCubit, UsersState>(
    "When request refreshUsers",
    build: () {
      when(mockGetUsers.call(dummyUsersRequest1))
          .thenAnswer((_) async => Right(users));

      return UsersCubit(mockGetUsers);
    },
    act: (UsersCubit usersCubit) => usersCubit.refreshUsers(dummyUsersRequest1),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const UsersState(),
      UsersState(status: UsersStatus.success, users: users),
    ],
  );
}
