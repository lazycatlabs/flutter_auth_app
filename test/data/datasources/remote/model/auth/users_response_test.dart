import 'dart:convert';

import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  const listUser = [
    DataUser(
      id: 7,
      email: "michael.lawson@reqres.in",
      firstName: "Michael",
      lastName: "Lawson",
      avatar: "https://reqres.in/img/faces/7-image.jpg",
    ),
    DataUser(
      id: 8,
      email: "lindsay.ferguson@reqres.in",
      firstName: "Lindsay",
      lastName: "Ferguson",
      avatar: "https://reqres.in/img/faces/8-image.jpg",
    ),
    DataUser(
      id: 9,
      email: "tobias.funke@reqres.in",
      firstName: "Tobias",
      lastName: "Funke",
      avatar: "https://reqres.in/img/faces/9-image.jpg",
    ),
    DataUser(
      id: 10,
      email: "byron.fields@reqres.in",
      firstName: "Byron",
      lastName: "Fields",
      avatar: "https://reqres.in/img/faces/10-image.jpg",
    ),
    DataUser(
      id: 11,
      email: "george.edwards@reqres.in",
      firstName: "George",
      lastName: "Edwards",
      avatar: "https://reqres.in/img/faces/11-image.jpg",
    ),
    DataUser(
      id: 12,
      email: "rachel.howell@reqres.in",
      firstName: "Rachel",
      lastName: "Howell",
      avatar: "https://reqres.in/img/faces/12-image.jpg",
    ),
  ];
  const userResponse = UsersResponse(
    page: 2,
    perPage: 6,
    total: 12,
    totalPages: 2,
    data: listUser,
    support: SupportUser(
      url: "https://reqres.in/#support-heading",
      text:
          "To keep ReqRes free, contributions towards server costs are appreciated!",
    ),
  );

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(successUserPath));

    /// act
    final result = UsersResponse.fromJson(jsonMap);

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
          "avatar": "https://reqres.in/img/faces/8-image.jpg",
        },
        {
          "id": 9,
          "email": "tobias.funke@reqres.in",
          "first_name": "Tobias",
          "last_name": "Funke",
          "avatar": "https://reqres.in/img/faces/9-image.jpg",
        },
        {
          "id": 10,
          "email": "byron.fields@reqres.in",
          "first_name": "Byron",
          "last_name": "Fields",
          "avatar": "https://reqres.in/img/faces/10-image.jpg",
        },
        {
          "id": 11,
          "email": "george.edwards@reqres.in",
          "first_name": "George",
          "last_name": "Edwards",
          "avatar": "https://reqres.in/img/faces/11-image.jpg",
        },
        {
          "id": 12,
          "email": "rachel.howell@reqres.in",
          "first_name": "Rachel",
          "last_name": "Howell",
          "avatar": "https://reqres.in/img/faces/12-image.jpg",
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
