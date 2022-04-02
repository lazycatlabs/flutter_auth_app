import 'dart:convert';

import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/json_reader.dart';
import '../../../../../helpers/paths.dart';

void main() {
  const registerResponse = RegisterResponse(id: 4, token: 'QpwL5tke4Pnpja7X4');

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(successRegisterPath));

    /// act
    final result = RegisterResponse.fromJson(jsonMap);

    /// assert
    expect(result, equals(registerResponse));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = registerResponse.toJson();

    /// arrange
    final exceptedJson = {
      "id": 4,
      "token": 'QpwL5tke4Pnpja7X4',
      'error': null,
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
