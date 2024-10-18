import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';
import 'users_cubit_test.mocks.dart';

@GenerateMocks([GetUsers])
void main() {
  late UsersCubit userCubit;
  late MockGetUsers mockGetUsers;
  late Users users;

  const dummyUsersRequest1 = UsersParams();
  const dummyUsersRequest2 = UsersParams(page: 2);
  const errorMessage = "";

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'users_cubit_test_');

    users = UsersResponse.fromJson(
      json.decode(jsonReader(pathUsersResponse200)) as Map<String, dynamic>,
    ).toEntity();
    mockGetUsers = MockGetUsers();
    userCubit = UsersCubit(mockGetUsers);
  });

  /// Dispose bloc
  tearDown(() {
    userCubit.close();
  });

  ///  Initial data should be loading
  test("Initial data should be UsersStatus.loading", () {
    expect(userCubit.state, const UsersState.loading());
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
      const UsersState.loading(),
      UsersState.success(users),
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
      const UsersState.loading(),
      UsersState.success(users),
    ],
  );

  blocTest<UsersCubit, UsersState>(
    "When call nextPage",
    build: () {
      when(mockGetUsers.call(any)).thenAnswer((_) async => Right(users));
      userCubit.lastPage = 2;
      return userCubit;
    },
    act: (UsersCubit usersCubit) => usersCubit.nextPage(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      UsersState.success(users),
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
    expect: () => const [
      UsersState.loading(),
      UsersState.failure(errorMessage),
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
      const UsersState.loading(),
      const UsersState.empty(),
    ],
  );

  blocTest<UsersCubit, UsersState>(
    "When request refreshUsers",
    build: () {
      when(mockGetUsers.call(dummyUsersRequest1))
          .thenAnswer((_) async => Right(users));

      return UsersCubit(mockGetUsers);
    },
    act: (UsersCubit usersCubit) => usersCubit.refresh(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const UsersState.loading(),
      UsersState.success(users),
    ],
  );
}
