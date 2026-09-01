import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/paths.dart';
import '../../../../helpers/test_mock.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late PostLogout postLogout;
  late String logout;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'post_logout_test_');
    logout =
        DiagnosticResponse.fromJson(
          json.decode(jsonReader(pathGeneralTokenResponse200))
              as Map<String, dynamic>,
        ).diagnostic?.message ??
        '';
    mockAuthRepository = MockAuthRepository();
    postLogout = PostLogout(mockAuthRepository);
  });

  test('should get logout from the repository', () async {
    /// arrange
    when(mockAuthRepository.logout()).thenAnswer((_) async => Right(logout));

    /// act
    await MainBoxMixin.mainBox?.put(MainBoxKeys.isLogin.name, true);
    final result = await postLogout.call(const NoParams());

    /// assert
    expect(result, equals(Right(logout)));
    expect(MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name), isNull);
  });
}
