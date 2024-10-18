import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  const diagnostic = Diagnostic(status: "200", message: "Success");

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(pathDiagnostic));

    /// act
    final result = Diagnostic.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(diagnostic));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = diagnostic.toJson();

    /// arrange
    final exceptedJson = {
      "status": "200",
      "message": "Success",
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
