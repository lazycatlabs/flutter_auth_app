import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/paths.dart';
import '../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late GetUsers getUsers;
  late Users users;
  final usersParams = UsersParams();

  setUp(() {
    users = UsersResponse.fromJson(json.decode(jsonReader(successUserPath)))
        .toEntity();
    mockAuthRepository = MockAuthRepository();
    getUsers = GetUsers(mockAuthRepository);
  });

  test("should get users from the repository", () async {
    /// arrange
    when(mockAuthRepository.users(usersParams))
        .thenAnswer((_) async => Right(users));

    /// act
    final result = await getUsers.call(usersParams);

    /// assert
    expect(result, equals(Right(users)));
  });
}
