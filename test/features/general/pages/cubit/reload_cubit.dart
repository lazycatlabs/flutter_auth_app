import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';
/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../helpers/fake_path_provider_platform.dart';

void main() {
  late ReloadFormCubit reloadFormCubit;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, isHiveEnable: false);
    reloadFormCubit = ReloadFormCubit();
  });

  blocTest(
    "The theme should be system",
    build: () {
      return reloadFormCubit;
    },
    act: (ReloadFormCubit settingsCubit) => settingsCubit.reload(),
    expect: () => [
      const ReloadFormState.initial(),
      const ReloadFormState.formUpdated(),
    ],
  );
}
