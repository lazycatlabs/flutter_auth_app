import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/entity_fixtures.dart';
import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostGeneralToken postGeneralToken;
  late GeneralToken generalToken;
  const generalTokenParams = GeneralTokenParams(
    clientId: 'base_auth_app',
    clientSecret: 'base_auth_secret_789',
  );

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'post_general_token_test_',
    );
    generalToken = buildGeneralTokenFixture(
      GeneralTokenResponse.fromJson(
        json.decode(jsonReader(pathGeneralTokenResponse200))
            as Map<String, dynamic>,
      ),
    );
    mockAuthRepository = MockAuthRepository();
    postGeneralToken = PostGeneralToken(mockAuthRepository);
  });

  test('should get general_token from the repository', () async {
    /// arrange
    when(
      mockAuthRepository.generalToken(generalTokenParams),
    ).thenAnswer((_) async => Right(generalToken));

    /// act
    final result = await postGeneralToken.call(generalTokenParams);

    /// assert
    expect(result, equals(Right(generalToken)));
    expect(
      MainBoxMixin.mainBox?.get(MainBoxKeys.apiClientId.name),
      generalTokenParams.clientId,
    );
    expect(
      MainBoxMixin.mainBox?.get(MainBoxKeys.generalToken.name),
      generalToken.token,
    );
  });

  test('parse GeneralTokenParams to json', () {
    /// act
    final result = generalTokenParams.toJson();
    final expected = {
      'clientId': 'base_auth_app',
      'clientSecret': 'base_auth_secret_789',
    };

    /// assert
    expect(result, equals(expected));
  });

  test('parse GeneralTokenParams from json', () {
    /// act
    final params = GeneralTokenParams.fromJson({
      'clientId': 'base_auth_app',
      'clientSecret': 'base_auth_secret_789',
    });

    /// assert
    expect(params, equals(generalTokenParams));
  });
}
