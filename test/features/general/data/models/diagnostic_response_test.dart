import 'dart:convert';

import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';

void main() {
  const diagnosticResponse = DiagnosticResponse(
    diagnostic: Diagnostic(status: "200", message: "Success"),
  );

  test('from json, should return a valid model from json', () {
    /// arrange
    final jsonMap = json.decode(jsonReader(pathDiagnosticResponse200));

    /// act
    final result = DiagnosticResponse.fromJson(jsonMap as Map<String, dynamic>);

    /// assert
    expect(result, equals(diagnosticResponse));
  });

  test('to json, should return a json map containing proper data', () {
    /// act
    final result = diagnosticResponse.toJson();

    /// arrange
    final exceptedJson = {
      "diagnostic": {
        "status": "200",
        "message": "Success",
      },
    };

    /// assert
    expect(result, equals(exceptedJson));
  });
}
