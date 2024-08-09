part of 'injection_container.dart';

final sl = GetIt.instance;

late final http.Client httpClient;
late final SharedPreferences prefs;
late final GoogleSignIn googleSignIn;
late final RSAService rsaService;
late final AESService aesService;
late final BrowserInfo browserInfo;

Future<void> instantiateDependencies() async {
  httpClient = http.Client();
  prefs = await SharedPreferences.getInstance();
  googleSignIn = GoogleSignIn(
    clientId: webClientId,
    scopes: [
      'email',
      'profile',
    ],
  );
  rsaService = const RSAService();
  aesService = AESService();
  browserInfo = BrowserInfo();
}

Future<void> init() async {
  //global injections.
  await instantiateDependencies();

  await _initAuth();
  await _initUserSearch();
  await _initUserDetails();
  await _initPushNotifications();
  await _initGameSearch();
  await _initGameDetails();
}

// Authentication.
Future<void> _initAuth() async {
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
      () => browserInfo,
    )
    ..registerLazySingleton(() => rsaService)
    ..registerLazySingleton(() => aesService)
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        customSignupClient: sl(),
        prefs: sl(),
        httpClient: sl(),
      ),
    )
    ..registerLazySingleton(() => CustomSignUpClient(googleSignIn: sl()))
    ..registerLazySingleton(() => CustomLocalStorage(prefs: sl()))
    ..registerLazySingleton(() => CustomHttpClient(httpClient: sl()))
    ..registerLazySingleton(() => googleSignIn)
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(() => httpClient);
}

//userSearch.
Future<void> _initUserSearch() async {
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
    );
}

//UserDetails
Future<void> _initUserDetails() async {
  sl
    ..registerFactory(
      () => UserDetailsBloc(
        getUserDetails: sl(),
        updateUserDetails: sl(),
      ),
    )
    ..registerLazySingleton(() => GetUserDetails(sl()))
    ..registerLazySingleton(() => UpdateUserDetails(sl()))
    ..registerLazySingleton<UserDetailsRepo>(() => UserDetailsRepoImpl(sl()))
    ..registerLazySingleton<UserDetailsRemoteDataSources>(
      () => UserDetailsDataScourceImpl(
        httpClient: sl(),
      ),
    );
}

// push notifications
Future<void> _initPushNotifications() async {
  sl
    ..registerFactory(
      () => PushNotificationBloc(
        imageUpload: sl(),
        imageDownload: sl(),
        sendNotifications: sl(),
      ),
    )
    ..registerLazySingleton(() => ImageUpload(sl()))
    ..registerLazySingleton(() => ImageDownload(sl()))
    ..registerLazySingleton(() => SendNotifications(sl()))
    ..registerLazySingleton<PushNotificationRepo>(
      () => PushNotificationRepoImpl(
        sl(),
      ),
    )
    ..registerLazySingleton<PushNotificationRemoteDataSources>(
      () => PushNotificationRemoteDataSourcesImpl(
        customHttpClient: sl(),
      ),
    );
}

Future<void> _initGameSearch() async {
  sl
    ..registerFactory(
      () => GameSearchBloc(
        searchGames: sl(),
      ),
    )
    ..registerLazySingleton(() => SearchGames(sl()))
    ..registerLazySingleton<GameSearchRepo>(() => GameSearchRepoImpl(sl()))
    ..registerLazySingleton<GameSearchRemoteDataSources>(
      () => GameSearchRemoteDataSourcesImpl(
        customHttpClient: sl(),
      ),
    );
}

Future<void> _initGameDetails() async {
  sl
    ..registerFactory(
      () => GameDetailsBloc(
        getGameDetails: sl(),
        updateGameDetails: sl(),
        downloadGameImages: sl(),
        uploadGameImages: sl(),
      ),
    )
    ..registerLazySingleton(() => GetGameDetails(sl()))
    ..registerLazySingleton(() => UpdateGameDetails(sl()))
    ..registerLazySingleton(() => DownloadGameImages(sl()))
    ..registerLazySingleton(() => UploadGameImages(sl()))
    ..registerLazySingleton<GameDetailsRepo>(() => GameDetailsRepoImpl(sl()))
    ..registerLazySingleton<GameDetailsRemoteDataSource>(
      () => GameDetailsRemoteDataSourceImpl(
        customHttpClient: sl(),
      ),
    );
}
