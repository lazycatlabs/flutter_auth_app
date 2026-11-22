import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/entity_fixtures.dart';
import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';
import 'login_cubit_test.mocks.dart';

@GenerateMocks([PostLogin])
void main() {
  late LoginCubit loginCubit;
  late Login login;
  late MockPostLogin mockPostLogin;

  const loginParams = LoginParams(
    email: 'mudassir@lazycatlabs.com',
    password: 'pass123',
  );
  const errorMessage = 'Wrong username or password';

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'login_cubit_test_');
    login = buildLoginFixture(
      LoginResponse.fromJson(
        json.decode(jsonReader(pathLoginResponse200)) as Map<String, dynamic>,
      ),
    );
    mockPostLogin = MockPostLogin();
    loginCubit = LoginCubit(mockPostLogin);
  });

  /// Dispose bloc
  tearDown(() => loginCubit.close());

  ///  Initial data should be loading
  test('Initial data should be AuthStatus.loading', () {
    expect(loginCubit.state, const LoginState.loading());
  });

  blocTest<LoginCubit, LoginState>(
    'When repo success get data should be return LoginState',
    build: () {
      when(
        mockPostLogin.call(loginParams),
      ).thenAnswer((_) async => Right(login));

      return loginCubit;
    },
    act: (cubit) => cubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => [const LoginState.loading(), LoginState.success(login.token)],
  );

  blocTest<LoginCubit, LoginState>(
    'When user input wrong credential should be return ServerFailure',
    build: () {
      when(
        mockPostLogin.call(loginParams),
      ).thenAnswer((_) async => const Left(ServerFailure(errorMessage)));

      return loginCubit;
    },
    act: (LoginCubit loginCubit) => loginCubit.login(loginParams),
    wait: const Duration(milliseconds: 100),
    expect: () => const [
      LoginState.loading(),
      LoginState.failure(errorMessage),
    ],
  );
}
