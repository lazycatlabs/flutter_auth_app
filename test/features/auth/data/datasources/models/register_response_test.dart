import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  const registerResponse = RegisterResponse(
    diagnostic: Diagnostic(
      status: "200",
      message: "Success",
    ),
    data: DataRegister(
      id: "8364aa6f-6887-4502-a6b0-62f082196476",
      name: "Mudassir",
      email: "mudassir@lazycatlabs.com",
      photo:
          "https://user-images.githubusercontent.com/1531684/281937715-f53c55be-4b70-43b5-bb50-11706fb71ada.png",
      verified: false,
      createdAt: "2024-08-25T15:04:28.191067",
      updatedAt: "2024-08-25T15:04:28.191067",
    ),
  );

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(pathRegisterResponse200));

    /// act
    final result = RegisterResponse.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(registerResponse));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = registerResponse.toJson();

    /// arrange
    final exceptedJson = {
      "diagnostic": {
        "status": "200",
        "message": "Success",
      },
      "data": {
        "id": "8364aa6f-6887-4502-a6b0-62f082196476",
        "name": "Mudassir",
        "email": "mudassir@lazycatlabs.com",
        "photo":
            "https://user-images.githubusercontent.com/1531684/281937715-f53c55be-4b70-43b5-bb50-11706fb71ada.png",
        "verified": false,
        "createdAt": "2024-08-25T15:04:28.191067",
        "updatedAt": "2024-08-25T15:04:28.191067",
      },
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
