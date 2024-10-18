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
import 'logout_cubit_test.mocks.dart';

@GenerateMocks([PostLogout])
void main() {
  late LogoutCubit logoutCubit;
  late String message;
  late MockPostLogout mockPostLogout;

  const errorMessage = "Error message";

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'logout_cubit_test_');
    message = DiagnosticResponse.fromJson(
          json.decode(jsonReader(pathDiagnosticResponse200))
              as Map<String, dynamic>,
        ).diagnostic?.message ??
        "";
    mockPostLogout = MockPostLogout();
    logoutCubit = LogoutCubit(mockPostLogout);
  });

  /// Dispose bloc
  tearDown(() => logoutCubit.close());

  ///  Initial data should be loading
  test("Initial data should be LogoutStatus.loading", () {
    expect(logoutCubit.state, const LogoutState.loading());
  });

  blocTest<LogoutCubit, LogoutState>(
    "When repo success get data should be return LogoutState",
    build: () {
      when(mockPostLogout.call(any)).thenAnswer((_) async => Right(message));

      return logoutCubit;
    },
    act: (cubit) => cubit.postLogout(),
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const LogoutState.loading(),
      LogoutState.success(message),
    ],
  );

  blocTest<LogoutCubit, LogoutState>(
    "When user input wrong credential should be return ServerFailure",
    build: () {
      when(mockPostLogout.call(any))
          .thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return logoutCubit;
    },
    act: (LogoutCubit logoutCubit) => logoutCubit.postLogout(),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      LogoutState.loading(),
      LogoutState.failure(errorMessage),
    ],
  );
}
