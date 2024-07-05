part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //global injections.
  final httpClient = http.Client();

  await _initAuth(httpClient);
  await _initUserSearch(httpClient);
}

// Authentication.
Future<void> _initAuth(http.Client httpClient) async {
  final prefs = await SharedPreferences.getInstance();

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
        browserInfo: sl(),
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
    ..registerLazySingleton(
      BrowserInfo.new,
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

//userSearch.
Future<void> _initUserSearch(http.Client httpClient) async {
  sl
    ..registerFactory(
      () => UserSearchBloc(
        userSearchResults: sl(),
      ),
    )
    ..registerLazySingleton(() => UserSearchResults(sl()))
    ..registerLazySingleton<UserSearchRepo>(() => UserSearchRepoImpl(sl()))
    ..registerLazySingleton<UserSearchRemoteDataSources>(
      () => UserSearchDataSourceImpl(
        httpClient: sl(),
      ),
    )
    ..registerLazySingleton(() => httpClient);
}
