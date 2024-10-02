import 'dart:convert';

import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  late DioAdapter dioAdapter;
  late AuthRemoteDatasourceImpl dataSource;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'auth_remote_datasource_test_',
    );
    dioAdapter = DioAdapter(dio: sl<DioClient>().dio);
    dataSource = AuthRemoteDatasourceImpl(sl<DioClient>());
  });

  group('register', () {
    const registerParams =
        RegisterParams(email: "mudassir@lazycatlabs.com", password: "Pass123");
    final registerModel = RegisterResponse.fromJson(
      json.decode(jsonReader(pathRegisterResponse200)) as Map<String, dynamic>,
    );

    test(
      'should return register success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.user,
          (server) => server.reply(
            200,
            json.decode(jsonReader(pathRegisterResponse200)),
          ),
          data: registerParams.toJson(),
        );

        /// act
        final result = await dataSource.register(registerParams);

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, registerModel),
        );
      },
    );

    test(
      'should return register unsuccessful model when response code is 400',
      () async {
        /// arrange

        dioAdapter.onPost(
          ListAPI.user,
          (server) => server.reply(
            400,
            json.decode(jsonReader(pathRegisterResponse400)),
          ),
          data: registerParams.toJson(),
        );

        /// act
        final result = await dataSource.register(registerParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });

  group('login', () {
    const loginParams =
        LoginParams(email: "mudassir@lazycatlabs.com", password: "Pass123");
    final loginModel = LoginResponse.fromJson(
      json.decode(jsonReader(pathLoginResponse200)) as Map<String, dynamic>,
    );

    test(
      'should return login success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            200,
            json.decode(jsonReader(pathLoginResponse200)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, loginModel),
        );
      },
    );

    test(
      'should return login unsuccessful model when response code is 401',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            401,
            json.decode(jsonReader(pathLoginResponse401)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });

  group('general token', () {
    const generalTokenParams =
        GeneralTokenParams(clientId: "apimock", clientSecret: "apimock_secret");
    final generalTokenResponse = GeneralTokenResponse.fromJson(
      json.decode(jsonReader(pathGeneralTokenResponse200))
          as Map<String, dynamic>,
    );

    test(
      'should return general token success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.generalToken,
          (server) => server.reply(
            200,
            json.decode(jsonReader(pathGeneralTokenResponse200)),
          ),
          data: generalTokenParams.toJson(),
        );

        /// act
        final result = await dataSource.generalToken(generalTokenParams);

        /// assert
        result.fold(
          (l) => expect(l, null),
          (r) => expect(r, generalTokenResponse),
        );
      },
    );

    test(
      'should return general token unsuccessful model when response code is 401',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            401,
            json.decode(jsonReader(pathGeneralTokenResponse401)),
          ),
          data: generalTokenParams.toJson(),
        );

        /// act
        final result = await dataSource.generalToken(generalTokenParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });
}
