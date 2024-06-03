part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initAuth();
}

Future<void> _initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  final httpClient = http.Client();

  sl
    ..registerFactory(
      () => AuthBloc(
        createUser: sl(),
        isAdmin: sl(),
        cacheUserToken: sl(),
        isUserLoggedIn: sl(),
      ),
    )
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => IsAdmin(sl()))
    ..registerLazySingleton(() => CacheUserToken(sl()))
    ..registerLazySingleton(() => IsUserLoggedIn(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        prefs: sl(),
        httpClient: sl(),
      ),
    )
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => httpClient);
}
//
// Future<void> _initOnBoarding() async {
//   final prefs = await SharedPreferences.getInstance();
//   // Feature --> OnBoarding
//   // Business Logic
//   sl
//     ..registerFactory(
//       () => OnBoardingCubit(
//         cacheFirstTimer: sl(),
//         checkIfUserIsFirstTimer: sl(),
//       ),
//     )
//     ..registerLazySingleton(() => CacheFirstTimer(sl()))
//     ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
//     ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
//     ..registerLazySingleton<OnBoardingLocalDataSource>(
//       () => OnBoardingLocalDataSrcImpl(sl()),
//     )
//     ..registerLazySingleton(() => prefs);
// }
