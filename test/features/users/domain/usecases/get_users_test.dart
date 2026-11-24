import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/entity_fixtures.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockUsersRepository mockUsersRepository;
  late GetUsers getUsers;
  late Users users;
  const usersParams = UsersParams();

  setUp(() {
    users = buildUsersFixture(
      UsersResponse.fromJson(
        json.decode(jsonReader(pathUsersResponse200)) as Map<String, dynamic>,
      ),
    );
    mockUsersRepository = MockUsersRepository();
    getUsers = GetUsers(mockUsersRepository);
  });

  test('should get users from the repository', () async {
    /// arrange
    when(
      mockUsersRepository.users(usersParams),
    ).thenAnswer((_) async => Right(users));

    /// act
    final result = await getUsers.call(usersParams);

    /// assert
    expect(result, equals(Right(users)));
  });

  test('parse UsersParams to json', () {
    /// act
    final result = usersParams.toJson();
    final expected = {'skip': 0, 'limit': 20};

    /// assert
    expect(result, equals(expected));
  });

  test('parse UsersParams from json', () {
    /// act
    final params = UsersParams.fromJson({'limit': 20});

    /// assert
    expect(params, equals(usersParams));
  });
}
