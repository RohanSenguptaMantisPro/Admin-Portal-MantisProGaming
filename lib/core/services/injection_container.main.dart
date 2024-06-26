part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initAuth();
}

Future<void> _initAuth() async {
  final prefs = await SharedPreferences.getInstance();
  final httpClient = http.Client();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId: webClientId,
    scopes: [
      'email',
      'profile',
    ],
  );
  final rsaService = RSAService();
  final aesService = AESService();

  sl
    ..registerFactory(
      () => AuthBloc(
        googleSignInService: sl(),
        createUser: sl(),
        isAdmin: sl(),
        cacheUserToken: sl(),
        isUserLoggedIn: sl(),
        fetchUserData: sl(),
        logOut: sl(),
        encryptionService: sl(),
      ),
    )
    ..registerLazySingleton(() => GoogleSignInService(sl()))
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => IsAdmin(sl()))
    ..registerLazySingleton(() => CacheUserToken(sl()))
    ..registerLazySingleton(() => IsUserLoggedIn(sl()))
    ..registerLazySingleton(() => FetchUserData(sl()))
    ..registerLazySingleton(() => LogOut(sl()))
    ..registerLazySingleton(
      () => EncryptionService(
        aesService: sl(),
        rsaService: sl(),
      ),
    )
    ..registerLazySingleton(() => rsaService)
    ..registerLazySingleton(() => aesService)
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        googleSignIn: sl(),
        prefs: sl(),
        httpClient: sl(),
      ),
    )
    ..registerLazySingleton(() => googleSignIn)
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
