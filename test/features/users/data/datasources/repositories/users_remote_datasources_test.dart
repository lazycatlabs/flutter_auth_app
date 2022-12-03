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
  late UsersRemoteDatasourceImpl dataSource;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    dioAdapter = DioAdapter(dio: sl<DioClient>().dio);
    dataSource = UsersRemoteDatasourceImpl(sl<DioClient>());
  });

  group('user', () {
    final usersParams = UsersParams();
    final usersModel =
        UsersResponse.fromJson(json.decode(jsonReader(successUserPath)));
    final usersEmptyModel =
        UsersResponse.fromJson(json.decode(jsonReader(emptyUserPath)));

    test(
      'should return list user success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onGet(
          ListAPI.users,
          (server) => server.reply(
            200,
            json.decode(jsonReader(successUserPath)),
          ),
          queryParameters: usersParams.toJson(),
        );

        /// act
        final result = await dataSource.users(usersParams);

        /// assert
        expect(usersModel, equals(result));
      },
    );

    test(
      'should return empty list user success model when response code is 200',
      () async {
        /// arrange
        dioAdapter.onGet(
          ListAPI.users,
          (server) => server.reply(
            200,
            json.decode(jsonReader(emptyUserPath)),
          ),
          queryParameters: usersParams.toJson(),
        );

        /// act
        final result = await dataSource.users(usersParams);

        /// assert
        expect(usersEmptyModel, equals(result));
      },
    );

    test(
      'should return user unsuccessful model when response code is 400',
      () async {
        /// arrange
        dioAdapter.onGet(
          ListAPI.users,
          (server) => server.reply(
            400,
            json.decode(jsonReader(successUserPath)),
          ),
          queryParameters: usersParams.toJson(),
        );

        /// act
        final result = dataSource.users(usersParams);

        /// assert
        expect(result, throwsA(isA<ServerException>()));
      },
    );
  });
}
