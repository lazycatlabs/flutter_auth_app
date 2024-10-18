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

import 'general_token_cubit_test.mocks.dart';

@GenerateMocks([PostGeneralToken])
void main() {
  late GeneralTokenCubit generalTokenCubit;
  late GeneralToken generalToken;
  late MockPostGeneralToken mockPostGeneralToken;

  const generalTokenParams = GeneralTokenParams(
    clientId: "apimock",
    clientSecret: "apimock_secret",
  );
  const errorMessage = "Unauthorized";

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'auth_cubit_test_');
    generalToken = GeneralTokenResponse.fromJson(
      json.decode(jsonReader(pathGeneralTokenResponse200))
          as Map<String, dynamic>,
    ).toEntity();
    mockPostGeneralToken = MockPostGeneralToken();
    generalTokenCubit = GeneralTokenCubit(mockPostGeneralToken);
  });

  /// Dispose bloc
  tearDown(() => generalTokenCubit.close());

  ///  Initial data should be loading
  test("Initial data should be AuthStatus.loading", () {
    expect(generalTokenCubit.state, const GeneralTokenState.loading());
  });

  blocTest<GeneralTokenCubit, GeneralTokenState>(
    "When repo success get data should be return GeneralTokenState",
    build: () {
      when(mockPostGeneralToken.call(generalTokenParams))
          .thenAnswer((_) async => Right(generalToken));

      return generalTokenCubit;
    },
    act: (cubit) => cubit.generalToken(generalTokenParams),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const GeneralTokenState.loading(),
      GeneralTokenState.success(generalToken.token),
    ],
  );

  blocTest<GeneralTokenCubit, GeneralTokenState>(
    "When user input wrong credential should be return ServerFailure",
    build: () {
      when(mockPostGeneralToken.call(generalTokenParams))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return generalTokenCubit;
    },
    act: (GeneralTokenCubit generalTokenCubit) =>
        generalTokenCubit.generalToken(generalTokenParams),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      GeneralTokenState.loading(),
      GeneralTokenState.failure(errorMessage),
    ],
  );
}
