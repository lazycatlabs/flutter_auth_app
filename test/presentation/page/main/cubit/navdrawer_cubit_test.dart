import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_auth_app/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late NavDrawerCubit _navDrawerCubit;

  setUp(() {
    _navDrawerCubit = NavDrawerCubit();
  });

  tearDown(() {
    _navDrawerCubit.close();
  });

  blocTest(
    "When user openDrawer it's should be dashboardPage",
    build: () {
      return _navDrawerCubit;
    },
    act: (NavDrawerCubit navDrawerCubit) =>
        navDrawerCubit.openDrawer(Navigation.dashboardPage),
    expect: () => [
      isA<BlocProvider>(),
    ],
  );

  blocTest(
    "When user openDrawer it's should be SettingsPage",
    build: () {
      return _navDrawerCubit;
    },
    act: (NavDrawerCubit navDrawerCubit) =>
        navDrawerCubit.openDrawer(Navigation.settingsPage),
    expect: () => [
      isA<SettingsPage>(),
    ],
  );
}
