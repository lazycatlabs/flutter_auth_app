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
  late PostLogin postLogin;
  late Login login;
  const loginParams = LoginParams(
    email: 'mudassir@lazycatlabs.com',
    password: 'pass123',
  );

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'post_login_test_');
    login = buildLoginFixture(
      LoginResponse.fromJson(
        json.decode(jsonReader(pathLoginResponse200)) as Map<String, dynamic>,
      ),
    );
    mockAuthRepository = MockAuthRepository();
    postLogin = PostLogin(mockAuthRepository);
  });

  test('should get login from the repository', () async {
    /// arrange
    when(
      mockAuthRepository.login(loginParams),
    ).thenAnswer((_) async => Right(login));

    /// act
    final result = await postLogin.call(loginParams);

    /// assert
    expect(result, equals(Right(login)));
    expect(MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name), isTrue);
    expect(MainBoxMixin.mainBox?.get(MainBoxKeys.authToken.name), login.token);
    expect(
      MainBoxMixin.mainBox?.get(MainBoxKeys.refreshToken.name),
      login.refreshToken,
    );
  });

  test('parse LoginParams to json', () {
    /// act
    final result = loginParams.toJson();
    final expected = {
      'email': 'mudassir@lazycatlabs.com',
      'password': 'pass123',
      'osInfo': null,
      'deviceInfo': null,
      'fcmToken': 'GeneratedFCMToken',
      'loginType': 'email',
    };

    /// assert
    expect(result, equals(expected));
  });

  test('parse LoginParams from json', () {
    /// act
    final params = LoginParams.fromJson({
      'email': 'mudassir@lazycatlabs.com',
      'password': 'pass123',
    });

    /// assert
    expect(params, equals(loginParams));
  });
}
