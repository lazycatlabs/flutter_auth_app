import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';

void main() {
  late SettingsCubit settingsCubit;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'settings_cubit_test_');
    settingsCubit = SettingsCubit();
  });

  blocTest(
    "The theme should be system",
    build: () => settingsCubit,
    act: (SettingsCubit settingsCubit) =>
        settingsCubit.updateTheme(ActiveTheme.system),
    expect: () => [
      isA<DataHelper>(),
    ],
  );

  blocTest(
    "The language should be updated",
    build: () => settingsCubit,
    act: (SettingsCubit settingsCubit) => settingsCubit.updateLanguage("en"),
    expect: () => [
      isA<DataHelper>(),
      isA<DataHelper>(),
    ],
  );
}
