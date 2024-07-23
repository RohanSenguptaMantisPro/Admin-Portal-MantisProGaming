part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //global injections.

  await _initAuth();
  await _initUserSearch();
  await _initUserDetails();
  await _initPushNotifications();
}

// Authentication.
Future<void> _initAuth() async {
  final httpClient = http.Client();
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
  final uploadFileToServer = UploadFileToServer();

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
        uploadFileToServer: sl(),
      ),
    )
    ..registerLazySingleton(() => uploadFileToServer);
}
