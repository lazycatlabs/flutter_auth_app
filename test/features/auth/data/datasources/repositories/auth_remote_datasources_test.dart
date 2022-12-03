import 'dart:convert';

import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  late DioAdapter dioAdapter;
  late AuthRemoteDatasourceImpl dataSource;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    dioAdapter = DioAdapter(dio: sl<DioClient>().dio);
    dataSource = AuthRemoteDatasourceImpl(sl<DioClient>());
  });

  group('register', () {
    final registerParams =
        RegisterParams(email: "eve.holt@reqres.in", password: "pistol");
    final registerModel =
        RegisterResponse.fromJson(json.decode(jsonReader(successRegisterPath)));

    test(
      'should return register success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.register,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successRegisterPath)),
          ),
          data: registerParams.toJson(),
        );

        /// act
        final result = await dataSource.register(registerParams);

        /// assert
        expect(registerModel, equals(result));
      },
    );

    test(
      'should return register unsuccessful model when response code is 400',
      () async {
        /// arrange

        dioAdapter.onPost(
          ListAPI.register,
          (server) => server.reply(
            400,
            json.decode(jsonReader(unSuccessRegisterPath)),
          ),
          data: registerParams.toJson(),
        );

        /// act
        final result = dataSource.register(registerParams);

        /// assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });

  group('login', () {
    final loginParams =
        LoginParams(email: "eve.holt@reqres.in", password: "cityslicka");
    final loginModel =
        LoginResponse.fromJson(json.decode(jsonReader(successLoginPath)));

    test(
      'should return login success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successLoginPath)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        expect(loginModel, equals(result));
      },
    );

    test(
      'should return login unsuccessful model when response code is 400',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
          (server) => server.reply(
            400,
            json.decode(jsonReader(unSuccessfulLoginPath)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = dataSource.login(loginParams);

        /// assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
