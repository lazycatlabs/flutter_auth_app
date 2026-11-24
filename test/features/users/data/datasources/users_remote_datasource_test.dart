import 'dart:convert';

import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  late DioAdapter primaryAdapter;
  late DioAdapter dummyJsonAdapter;
  late UsersRemoteDatasourceImpl dataSource;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'users_remote_datasource_test_',
    );
    primaryAdapter = DioAdapter(dio: sl<DioClient>().dio);
    dummyJsonAdapter = DioAdapter(dio: sl<DioClientDummyJson>().dio);
    dataSource = UsersRemoteDatasourceImpl(
      sl<DioClient>(),
      sl<DioClientDummyJson>(),
    );
  });

  group('users', () {
    const usersParams = UsersParams();
    const paginationQuery = {'limit': 20, 'skip': 0};
    final usersModel = UsersResponse.fromJson(
      json.decode(jsonReader(pathUsersResponse200)) as Map<String, dynamic>,
    );
    final usersEmptyModel = UsersResponse.fromJson(
      json.decode(jsonReader(pathUsersEmptyResponse200))
          as Map<String, dynamic>,
    );

    test(
      'should return list user success model when response code is 200',
      () async {
        /// arrange
        dummyJsonAdapter.onGet(
          ListAPI.users,
          (server) =>
              server.reply(200, json.decode(jsonReader(pathUsersResponse200))),
          queryParameters: paginationQuery,
        );

        /// act
        final result = await dataSource.users(usersParams);

        /// assert
        result.fold((l) => expect(l, null), (r) => expect(r, usersModel));
      },
    );

    test(
      'should return empty list user success model when response code is 200',
      () async {
        /// arrange
        dummyJsonAdapter.onGet(
          ListAPI.users,
          (server) => server.reply(
            200,
            json.decode(jsonReader(pathUsersEmptyResponse200)),
          ),
          queryParameters: paginationQuery,
        );

        /// act
        final result = await dataSource.users(usersParams);

        /// assert
        result.fold((l) => expect(l, null), (r) => expect(r, usersEmptyModel));
      },
    );

    test('should convert page to DummyJSON skip parameter', () async {
      /// arrange
      const secondPageParams = UsersParams(page: 2);
      dummyJsonAdapter.onGet(
        ListAPI.users,
        (server) =>
            server.reply(200, json.decode(jsonReader(pathUsersResponse200))),
        queryParameters: const {'limit': 20, 'skip': 20},
      );

      /// act
      final result = await dataSource.users(secondPageParams);

      /// assert
      expect(result.isRight, isTrue);
    });

    test('should not send the LazyAuth token to DummyJSON', () async {
      /// arrange
      sl<DioClientDummyJson>().dio.options.headers['Authorization'] =
          'Bearer secret';
      dummyJsonAdapter.onGet(
        ListAPI.users,
        (server) => server.replyCallback(200, (request) {
          expect(request.headers.containsKey('Authorization'), isFalse);
          return json.decode(jsonReader(pathUsersResponse200));
        }),
        queryParameters: paginationQuery,
      );

      /// act
      final result = await dataSource.users(usersParams);

      /// assert
      expect(result.isRight, isTrue);
    });

    test(
      'should return user unsuccessful model when response code is 400',
      () async {
        /// arrange
        dummyJsonAdapter.onGet(
          ListAPI.users,
          (server) =>
              server.reply(400, json.decode(jsonReader(pathUserResponse401))),
          queryParameters: paginationQuery,
        );

        /// act
        final result = await dataSource.users(usersParams);

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });

  group('user', () {
    final userModel = UserResponse.fromJson(
      json.decode(jsonReader(pathUserResponse200)) as Map<String, dynamic>,
    );

    test(
      'should return list user success model when response code is 200',
      () async {
        /// arrange
        primaryAdapter.onGet(
          ListAPI.user,
          (server) =>
              server.reply(200, json.decode(jsonReader(pathUserResponse200))),
        );

        /// act
        final result = await dataSource.user();

        /// assert
        result.fold((l) => expect(l, null), (r) => expect(r, userModel));
      },
    );

    test(
      'should return user unsuccessful model when response code is 400',
      () async {
        /// arrange
        primaryAdapter.onGet(
          ListAPI.user,
          (server) =>
              server.reply(400, json.decode(jsonReader(pathUserResponse401))),
        );

        /// act
        final result = await dataSource.user();

        /// assert
        result.fold(
          (l) => expect(l, isA<ServerFailure>()),
          (r) => expect(r, null),
        );
      },
    );
  });
}
