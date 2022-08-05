import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_app/data/data.dart';
import 'package:flutter_auth_app/domain/domain.dart';
import 'package:flutter_auth_app/presentation/pages/pages.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> serviceLocator({bool isUnitTest = false}) async {
  /// For unit testing only
  if (isUnitTest) {
    WidgetsFlutterBinding.ensureInitialized();
    sl.reset();
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    await SharedPreferences.getInstance().then((value) {
      initPrefManager(value);
    });
    sl.registerSingleton<DioClient>(DioClient(isUnitTest: true));
    dataSources();
    repositories();
    useCase();
    cubit();
  } else {
    sl.registerSingleton<DioClient>(DioClient());
    dataSources();
    repositories();
    useCase();
    cubit();
  }
}

// Register prefManager
void initPrefManager(SharedPreferences initPrefManager) {
  sl.registerLazySingleton<PrefManager>(() => PrefManager(initPrefManager));
}

/// Register repositories
void repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}

/// Register dataSources
void dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
}

void useCase() {
  /// Auth
  sl.registerLazySingleton(() => PostLogin(sl()));
  sl.registerLazySingleton(() => PostRegister(sl()));
  sl.registerLazySingleton(() => GetUsers(sl()));
}

void cubit() {
  sl.registerFactory(() => UsersCubit(sl()));
  sl.registerFactory(() => RegisterCubit(sl()));
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerFactory(() => SettingsCubit());
}
