import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('starts on the dashboard', () {
    expect(MainCubit().state, MainMenu.dashboard);
  });

  blocTest<MainCubit, MainMenu>(
    'select emits the chosen menu',
    build: MainCubit.new,
    act: (cubit) => cubit.select(MainMenu.settings),
    expect: () => [MainMenu.settings],
  );
}
