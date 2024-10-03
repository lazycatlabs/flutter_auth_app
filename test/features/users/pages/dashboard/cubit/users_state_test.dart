import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  group('UsersStatusX', () {
    test('returns correct values for UsersStatus.loading', () {
      const status = UsersState.loading();
      expect(status, const UsersState.loading());
    });

    test('returns correct values for UsersStatus.success', () {
      final usersResponse = UsersResponse.fromJson(
        json.decode(jsonReader(pathUsersResponse200)) as Map<String, dynamic>,
      ).toEntity();
      final status = UsersState.success(usersResponse.users ?? []);
      expect(status, UsersState.success(usersResponse.users ?? []));
    });

    test('returns correct values for UsersStatus.failure', () {
      const status = UsersState.failure("");
      expect(status, const UsersState.failure(""));
    });
    test('returns correct values for UsersStatus.empty', () {
      const status = UsersState.empty();
      expect(status, const UsersState.empty());
    });
  });
}
