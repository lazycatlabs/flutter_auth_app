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
import 'user_cubit_test.mocks.dart';

@GenerateMocks([GetUser])
void main() {
  late UserCubit userCubit;
  late User user;
  late MockGetUser mockGetUser;

  const errorMessage = "Error message";

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'user_cubit_test_');
    user = UserResponse.fromJson(
      json.decode(jsonReader(pathUserResponse200)) as Map<String, dynamic>,
    ).toEntity();
    mockGetUser = MockGetUser();
    userCubit = UserCubit(mockGetUser);
  });

  /// Dispose bloc
  tearDown(() => userCubit.close());

  ///  Initial data should be loading
  test("Initial data should be UserStatus.loading", () {
    expect(userCubit.state, const UserState.loading());
  });

  blocTest<UserCubit, UserState>(
    "When repo success get data should be return UserState",
    build: () {
      when(mockGetUser.call(any)).thenAnswer((_) async => Right(user));

      return userCubit;
    },
    act: (cubit) => cubit.getUser(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const UserState.loading(),
      UserState.success(user),
    ],
  );

  blocTest<UserCubit, UserState>(
    "When user input wrong credential should be return ServerFailure",
    build: () {
      when(mockGetUser.call(any))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return userCubit;
    },
    act: (UserCubit userCubit) => userCubit.getUser(),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      UserState.loading(),
      UserState.failure(errorMessage),
    ],
  );
}
