import 'package:flutter_test/flutter_test.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

class FakePathProvider extends PathProviderPlatform {
  @override
  Future<String?> getApplicationDocumentsPath() async => '.docs';

  @override
  Future<String?> getDownloadsPath() async => '.downloads';

  @override
  Future<String?> getTemporaryPath() async => '.temp';

  @override
  Future<String?> getApplicationSupportPath() async => '.applicationSupport';
}
