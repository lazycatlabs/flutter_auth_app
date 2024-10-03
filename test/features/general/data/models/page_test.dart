import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  const page = Page(currentPage: 1, lastPage: 5, perPage: 20, total: 100);

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(pathPage));

    /// act
    final result = Page.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(page));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = page.toJson();

    /// arrange
    final exceptedJson = {
      "currentPage": 1,
      "perPage": 20,
      "lastPage": 5,
      "total": 100,
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
