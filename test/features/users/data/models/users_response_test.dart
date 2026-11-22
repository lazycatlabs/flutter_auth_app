import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  const usersResponse = UsersResponse(
    users: [
      DataUsersItem(
        id: 1,
        firstName: 'Emily',
        lastName: 'Johnson',
        email: 'emily.johnson@x.dummyjson.com',
        image: 'https://dummyjson.com/icon/emilys/128',
      ),
    ],
    total: 208,
    skip: 0,
    limit: 20,
  );

  test('from json, should return a valid model from json', () {
    final jsonMap = json.decode(jsonReader(pathUsersResponse200));

    final result = UsersResponse.fromJson(jsonMap as Map<String, dynamic>);

    expect(result, equals(usersResponse));
  });

  test('to json, should return a json map containing proper data', () {
    final result = usersResponse.toJson();

    expect(
      result,
      equals({
        'users': [
          {
            'id': 1,
            'firstName': 'Emily',
            'lastName': 'Johnson',
            'email': 'emily.johnson@x.dummyjson.com',
            'image': 'https://dummyjson.com/icon/emilys/128',
          },
        ],
        'total': 208,
        'skip': 0,
        'limit': 20,
      }),
    );
  });

  test('UsersParams serializes page as DummyJSON skip', () {
    expect(const UsersParams(page: 3).toJson(), {'limit': 20, 'skip': 40});
  });
}
