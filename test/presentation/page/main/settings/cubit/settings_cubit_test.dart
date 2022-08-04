import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SettingsCubit settingsCubit;

  setUp(() {
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
    act: (SettingsCubit settingsCubit) => settingsCubit.reloadWidget(),
    expect: () => [
      isA<int>(),
    ],
  );
}
