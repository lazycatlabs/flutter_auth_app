import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// ignore: depend_on_referenced_packages
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import '../../../../../helpers/fake_path_provider_platform.dart';
import '../../../../../helpers/test_mock.mocks.dart';

void main() {
  late MainCubit mainCubit;
  late DataHelper menu;
  late MockBuildContext mockBuildContext;

  /// Initialize data
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    PathProviderPlatform.instance = FakePathProvider();
    await serviceLocator(isUnitTest: true, prefixBox: 'main_cubit_test_');
    mainCubit = MainCubit();
    mockBuildContext = MockBuildContext();
    menu = DataHelper(title: "Dashboard", isSelected: true);
  });

  /// Dispose bloc
  tearDown(() => mainCubit.close());

  ///  Initial data should be loading
  test("Initial data should be MainStatus.loading", () {
    expect(mainCubit.state, const MainState.loading());
  });

  blocTest<MainCubit, MainState>(
    "When initMenu success get data should be return MainState",
    build: () => mainCubit,
    act: (cubit) => cubit.initMenu(MockBuildContext(), mockMenu: menu),
    wait: const Duration(milliseconds: 300),
    expect: () => [
      const MainState.loading(),
      MainState.success(menu),
    ],
  );

  test('onBackPressed returns true if current menu is dashboard', () {
    when(mockBuildContext.dependOnInheritedWidgetOfExactType())
        .thenReturn(null);
    mainCubit.initMenu(mockBuildContext);
    expect(
      mainCubit.onBackPressed(mockBuildContext, GlobalKey<ScaffoldState>()),
      true,
    );
  });

  test('onBackPressed returns false if current menu is not dashboard', () {
    when(mockBuildContext.dependOnInheritedWidgetOfExactType())
        .thenReturn(null);
    mainCubit.initMenu(mockBuildContext);
    mainCubit.updateIndex(1, context: mockBuildContext, menu);
    expect(
      mainCubit.onBackPressed(
        mockBuildContext,
        GlobalKey<ScaffoldState>(),
        isDrawerClosed: true,
      ),
      false,
    );
    expect(
      mainCubit.onBackPressed(mockBuildContext, GlobalKey<ScaffoldState>()),
      false,
    );
  });
}
