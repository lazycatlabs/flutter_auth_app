import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostGeneralToken postGeneralToken;
  late GeneralToken generalToken;
  const generalTokenParams =
      GeneralTokenParams(clientId: "apimock", clientSecret: "apimock_secret");

  setUp(() {
    generalToken = GeneralTokenResponse.fromJson(
      json.decode(jsonReader(pathGeneralTokenResponse200))
          as Map<String, dynamic>,
    ).toEntity();
    mockAuthRepository = MockAuthRepository();
    postGeneralToken = PostGeneralToken(mockAuthRepository);
  });

  test("should get general_token from the repository", () async {
    /// arrange
    when(mockAuthRepository.generalToken(generalTokenParams))
        .thenAnswer((_) async => Right(generalToken));

    /// act
    final result = await postGeneralToken.call(generalTokenParams);

    /// assert
    expect(result, equals(Right(generalToken)));
  });

  test("parse GeneralTokenParams to json", () {
    /// act
    final result = generalTokenParams.toJson();
    final expected = {"clientId": "apimock", "clientSecret": "apimock_secret"};

    /// assert
    expect(result, equals(expected));
  });

  test("parse GeneralTokenParams from json", () {
    /// act
    final params = GeneralTokenParams.fromJson({
      "clientId": "apimock",
      "clientSecret": "apimock_secret",
    });

    /// assert
    expect(params, equals(generalTokenParams));
  });
}
