import 'package:flutter_auth_app/core/api/api.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> serviceLocator({
  bool isUnitTest = false,
  bool isHiveEnable = true,
  String prefixBox = '',
}) async {
  if (isUnitTest) {
    await sl.reset();
  }

  if (isHiveEnable) {
    await _initHiveBoxes(prefixBox: prefixBox);
  }

  sl
    ..registerSingleton<DioClient>(DioClient(isUnitTest: isUnitTest))
    ..registerSingleton<DioClientDummyJson>(
      DioClientDummyJson(isUnitTest: isUnitTest),
    );
  _dataSources();
  _repositories();
  _useCases();
  _cubits();
}

Future<void> _initHiveBoxes({String prefixBox = ''}) async {
  await MainBoxMixin.initHive(prefixBox);
  sl.registerSingleton<MainBoxMixin>(MainBoxMixin());
}

void _repositories() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(sl()));
}

void _dataSources() {
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(sl()),
  );
  sl.registerLazySingleton<UsersRemoteDatasource>(
    () => UsersRemoteDatasourceImpl(sl(), sl()),
  );
}

void _useCases() {
  sl
    ..registerLazySingleton(() => PostLogin(sl()))
    ..registerLazySingleton(() => PostLogout(sl()))
    ..registerLazySingleton(() => PostRegister(sl()))
    ..registerLazySingleton(() => PostGeneralToken(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))
    ..registerLazySingleton(() => GetUser(sl()));
}

void _cubits() {
  sl
    ..registerFactory(() => RegisterCubit(sl()))
    ..registerFactory(() => AuthCubit(sl()))
    ..registerFactory(() => GeneralTokenCubit(sl()))
    ..registerFactory(() => LogoutCubit(sl()))
    ..registerFactory(() => UserCubit(sl()))
    ..registerFactory(() => UsersCubit(sl()))
    ..registerFactory(SettingsCubit.new)
    ..registerFactory(MainCubit.new);
}
