import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../helpers/fake_path_provider_platform.dart';

void main() {
  test('service locator resolves the auth remote datasource', () async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(
      isUnitTest: true,
      prefixBox: 'dependencies_injection_test_',
    );

    expect(sl<AuthRemoteDatasource>(), isA<AuthRemoteDatasourceImpl>());
  });
}
