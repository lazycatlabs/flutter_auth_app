import 'dart:convert';

import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/di/di.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';

void main() {
  late DioAdapter dioAdapter;
  late AuthRemoteDatasourceImpl dataSource;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    dioAdapter = DioAdapter(dio: sl<DioClient>().dio);
    dataSource = AuthRemoteDatasourceImpl(sl<DioClient>());
  });

  group('register', () {
    final _registerParams =
        RegisterParams(email: "eve.holt@reqres.in", password: "pistol");
    final _registerModel =
        RegisterResponse.fromJson(json.decode(jsonReader(successRegisterPath)));

    test(
      'should return register success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListApi.register,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successRegisterPath)),
          ),
          data: _registerParams.toJson(),
        );

        /// act
        final _result = await dataSource.register(_registerParams);

        /// assert
        expect(_registerModel, equals(_result));
      },
    );

    test(
      'should return register unsuccessful model when response code is 400',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListApi.register,
          (server) => server.reply(
            400,
            json.decode(jsonReader(unSuccessRegisterPath)),
          ),
          data: _registerParams.toJson(),
        );

        /// act
        final _result = dataSource.register(_registerParams);

        /// assert
        expect(_result, throwsA(isA<ServerException>()));
      },
    );
  });

  group('login', () {
    final _loginParams =
        LoginParams(email: "eve.holt@reqres.in", password: "cityslicka");
    final _loginModel =
        LoginResponse.fromJson(json.decode(jsonReader(successLoginPath)));

    test(
      'should return login success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListApi.login,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successLoginPath)),
          ),
          data: _loginParams.toJson(),
        );

        /// act
        final _result = await dataSource.login(_loginParams);

        /// assert
        expect(_loginModel, equals(_result));
      },
    );

    test(
      'should return login unsuccessful model when response code is 400',
      () async {
        /// arrange
        dioAdapter.onPost(
          ListApi.login,
          (server) => server.reply(
            400,
            json.decode(jsonReader(unSuccessfulLoginPath)),
          ),
          data: _loginParams.toJson(),
        );

        /// act
        final _result = dataSource.login(_loginParams);

        /// assert
        expect(_result, throwsA(isA<ServerException>()));
      },
    );
  });

  group('user', () {
    final _usersParams = UsersParams();
    final _usersModel =
        UsersResponse.fromJson(json.decode(jsonReader(successUserPath)));
    final _usersEmptyModel =
        UsersResponse.fromJson(json.decode(jsonReader(emptyUserPath)));

    test(
      'should return list user success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onGet(
          ListApi.users,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successUserPath)),
          ),
          queryParameters: _usersParams.toJson(),
        );

        /// act
        final _result = await dataSource.users(_usersParams);

        /// assert
        expect(_usersModel, equals(_result));
      },
    );

    test(
      'should return empty list user success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onGet(
          ListApi.users,
          (server) => server.reply(
            200,
            json.decode(jsonReader(emptyUserPath)),
          ),
          queryParameters: _usersParams.toJson(),
        );

        /// act
        final _result = await dataSource.users(_usersParams);

        /// assert
        expect(_usersEmptyModel, equals(_result));
      },
    );

    test(
      'should return user unsuccessful model when response code is 400',
      () async {
        /// arrange
        dioAdapter.onGet(
          ListApi.users,
          (server) => server.reply(
            400,
            json.decode(jsonReader(successUserPath)),
          ),
          queryParameters: _usersParams.toJson(),
        );

        /// act
        final _result = dataSource.users(_usersParams);

        /// assert
        expect(_result, throwsA(isA<ServerException>()));
      },
    );
  });
}
