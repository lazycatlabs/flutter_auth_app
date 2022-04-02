import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late SettingsCubit _settingsCubit;

  setUp(() {
    _settingsCubit = SettingsCubit();
  });

  tearDown(() {
    _settingsCubit.close();
  });

  blocTest(
    "Return random int to reload main widget",
    build: () {
      return _settingsCubit;
    },
    act: (SettingsCubit settingsCubit) => settingsCubit.reloadWidget(),
    expect: () => [
      isA<int>(),
    ],
  );
}
