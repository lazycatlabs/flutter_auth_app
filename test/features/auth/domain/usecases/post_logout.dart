import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostLogout postLogout;
  late String logout;

  setUp(() {
    logout = DiagnosticResponse.fromJson(
          json.decode(jsonReader(pathGeneralTokenResponse200))
              as Map<String, dynamic>,
        ).diagnostic?.message ??
        "";
    mockAuthRepository = MockAuthRepository();
    postLogout = PostLogout(mockAuthRepository);
  });

  test("should get logout from the repository", () async {
    /// arrange
    when(mockAuthRepository.logout()).thenAnswer((_) async => Right(logout));

    /// act
    final result = await postLogout.call(NoParams());

    /// assert
    expect(result, equals(Right(logout)));
  });
}
