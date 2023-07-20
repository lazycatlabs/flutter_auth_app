import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  final listUser = [
    DataUser.fromJson({
      "id": 7,
      "email": "michael.lawson@reqres.in",
      "first_name": "Michael",
      "last_name": "Lawson",
      "avatar": "https://reqres.in/img/faces/7-image.jpg",
    }),
    DataUser.fromJson({
      "id": 8,
      "email": "lindsay.ferguson@reqres.in",
      "first_name": "Lindsay",
      "last_name": "Ferguson",
      "avatar": "https://reqres.in/img/faces/8-image.jpg"
    }),
    DataUser.fromJson({
      "id": 9,
      "email": "tobias.funke@reqres.in",
      "first_name": "Tobias",
      "last_name": "Funke",
      "avatar": "https://reqres.in/img/faces/9-image.jpg"
    }),
    DataUser.fromJson({
      "id": 10,
      "email": "byron.fields@reqres.in",
      "first_name": "Byron",
      "last_name": "Fields",
      "avatar": "https://reqres.in/img/faces/10-image.jpg"
    }),
    DataUser.fromJson({
      "id": 11,
      "email": "george.edwards@reqres.in",
      "first_name": "George",
      "last_name": "Edwards",
      "avatar": "https://reqres.in/img/faces/11-image.jpg"
    }),
    DataUser.fromJson({
      "id": 12,
      "email": "rachel.howell@reqres.in",
      "first_name": "Rachel",
      "last_name": "Howell",
      "avatar": "https://reqres.in/img/faces/12-image.jpg"
    }),
  ];
  final userResponse = UsersResponse(
    page: 2,
    perPage: 6,
    total: 12,
    totalPages: 2,
    data: listUser,
    support: const SupportUser(
      url: "https://reqres.in/#support-heading",
      text:
          "To keep ReqRes free, contributions towards server costs are appreciated!",
    ),
  );

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(successUserPath));

    /// act
    final result = UsersResponse.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(userResponse));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = userResponse.toJson();

    /// arrange
    final exceptedJson = {
      "page": 2,
      "per_page": 6,
      "total": 12,
      "total_pages": 2,
      "data": [
        {
          "id": 7,
          "email": "michael.lawson@reqres.in",
          "first_name": "Michael",
          "last_name": "Lawson",
          "avatar": "https://reqres.in/img/faces/7-image.jpg",
        },
        {
          "id": 8,
          "email": "lindsay.ferguson@reqres.in",
          "first_name": "Lindsay",
          "last_name": "Ferguson",
          "avatar": "https://reqres.in/img/faces/8-image.jpg"
        },
        {
          "id": 9,
          "email": "tobias.funke@reqres.in",
          "first_name": "Tobias",
          "last_name": "Funke",
          "avatar": "https://reqres.in/img/faces/9-image.jpg"
        },
        {
          "id": 10,
          "email": "byron.fields@reqres.in",
          "first_name": "Byron",
          "last_name": "Fields",
          "avatar": "https://reqres.in/img/faces/10-image.jpg"
        },
        {
          "id": 11,
          "email": "george.edwards@reqres.in",
          "first_name": "George",
          "last_name": "Edwards",
          "avatar": "https://reqres.in/img/faces/11-image.jpg"
        },
        {
          "id": 12,
          "email": "rachel.howell@reqres.in",
          "first_name": "Rachel",
          "last_name": "Howell",
          "avatar": "https://reqres.in/img/faces/12-image.jpg"
        },
      ],
      "support": {
        "url": "https://reqres.in/#support-heading",
        "text":
            "To keep ReqRes free, contributions towards server costs are appreciated!",
      },
      "error": null,
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
