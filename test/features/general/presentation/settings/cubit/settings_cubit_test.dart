import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SettingsCubit settingsCubit;

  setUp(() async {
    await serviceLocator(isUnitTest: true);
    settingsCubit = SettingsCubit();
  });

  tearDown(() {
    settingsCubit.close();
  });

  blocTest(
    "Return random int to reload main widget",
    build: () {
      return settingsCubit;
    },
    act: (SettingsCubit settingsCubit) =>
        settingsCubit.updateTheme(ActiveTheme.system),
    expect: () => [
      isA<DataHelper>(),
    ],
  );
}
