import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/fetch_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/log_out.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/browser_info.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/encryption_service.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/cache_user_token.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/create_user.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/google_sign_in_service.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_admin.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_user_logged_in.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateUser extends Mock implements CreateUser {}

class MockIsAdmin extends Mock implements IsAdmin {}

class MockCacheUserToken extends Mock implements CacheUserToken {}

class MockIsUserLoggedIn extends Mock implements IsUserLoggedIn {}

class MockEncryptionService extends Mock implements EncryptionService {}

class MockGoogleSignInService extends Mock implements GoogleSignInService {}

class MockFetchUserData extends Mock implements FetchUserData {}

class MockLogOut extends Mock implements LogOut {}

class MockBroswerInfo extends Mock implements BrowserInfo {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late CreateUser createUser;
  late IsAdmin isAdmin;
  late CacheUserToken cacheUserToken;
  late IsUserLoggedIn isUserLoggedIn;
  late EncryptionService encryptionService;
  late BrowserInfo mockBrowserInfo;
  late GoogleSignInService googleSignInService;
  late FetchUserData fetchUserData;
  late LogOut logOut;
  late AuthBloc authBloc;

  const tUserToken = 'test user token';
  const tEncryptedDataMap = {'data': 'encryptedData'};
  const tDeviceInfoMap = {
    'deviceModel': 'MantisAdminPortal-browserinfo',
    'deviceUid': 'ipaddress',
    'systemLocale': 'locale',
  };

  setUp(() {
    createUser = MockCreateUser();
    isAdmin = MockIsAdmin();
    cacheUserToken = MockCacheUserToken();
    isUserLoggedIn = MockIsUserLoggedIn();
    googleSignInService = MockGoogleSignInService();
    fetchUserData = MockFetchUserData();
    logOut = MockLogOut();

    encryptionService = MockEncryptionService();
    mockBrowserInfo = MockBroswerInfo();
    authBloc = AuthBloc(
      googleSignInService: googleSignInService,
      createUser: createUser,
      isAdmin: isAdmin,
      cacheUserToken: cacheUserToken,
      isUserLoggedIn: isUserLoggedIn,
      fetchUserData: fetchUserData,
      logOut: logOut,
      encryptionService: encryptionService,
    );
  });

  tearDown(() => authBloc.close());

  test('initialState should be [AuthInitial]', () {
    expect(authBloc.state, const AuthInitial());
  });

  final tServerFailure = ServerFailure(
    message: 'user-not-found',
    statusCode: '505',
  );

  const tAdminDetails = AdminDetails.empty();

  // also right isLoggedIn tests here.
  group('IsUserLoggedInEvent', () {
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, IsLoggedIn]',
      build: () {
        when(() => isUserLoggedIn()).thenAnswer(
          (_) async => const Right(
            tUserToken,
          ),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const IsUserLoggedInEvent(),
      ),
      expect: () => [
        const AuthLoading(),
        const CheckingIsUserLoggedIn(),
        const IsLoggedInStatus(loggedInUserToken: tUserToken),
      ],
      verify: (_) {
        verify(() => isUserLoggedIn()).called(1);
        verifyNoMoreInteractions(isUserLoggedIn);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthError, LoggedInCheckFailed] when fails',
      build: () {
        when(() => isUserLoggedIn()).thenAnswer(
          (_) async => Left(
            tServerFailure,
          ),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const IsUserLoggedInEvent(),
      ),
      expect: () => [
        const AuthLoading(),
        const CheckingIsUserLoggedIn(),
        const LoggedInCheckFailed(),
      ],
      verify: (_) {
        verify(() => isUserLoggedIn()).called(1);
        verifyNoMoreInteractions(isUserLoggedIn);
      },
    );
  });

  // createUser Event.
  group('CreateUserEvent', () {
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthError] when Google Sign-In fails',
      build: () {
        when(() => googleSignInService()).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(const CreateUserEvent()),
      expect: () => [
        const AuthLoading(),
        AuthError(tServerFailure.message),
      ],
      verify: (_) {
        verify(() => googleSignInService()).called(1);
        verifyNoMoreInteractions(googleSignInService);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthError] when encryption fails',
      build: () {
        when(() => googleSignInService())
            .thenAnswer((_) async => const Right(tUserToken));
        when(() => encryptionService.encrypt(tUserToken)).thenReturn(null);

        return authBloc;
      },
      act: (bloc) => bloc.add(const CreateUserEvent()),
      expect: () => [
        const AuthLoading(),
        const AuthError('Error in encryption.'),
      ],
      verify: (_) {
        verify(() => googleSignInService()).called(1);
        verify(() => encryptionService.encrypt(tUserToken)).called(1);
        verifyNoMoreInteractions(googleSignInService);
        verifyNoMoreInteractions(encryptionService);
      },
    );
    //
    blocTest<AuthBloc, AuthState>(
      'should emit [CreatedUser] when user creation is successful',
      build: () {
        when(() => googleSignInService())
            .thenAnswer((_) async => const Right(tUserToken));
        when(() => encryptionService.encrypt(tUserToken))
            .thenReturn(tEncryptedDataMap);
        when(() => mockBrowserInfo.deviceInfo())
            .thenAnswer((_) async => tDeviceInfoMap);
        when(() => createUser({...tEncryptedDataMap, ...tDeviceInfoMap}))
            .thenAnswer((_) async => const Right(tUserToken));
        return authBloc;
      },
      act: (bloc) => bloc.add(const CreateUserEvent()),
      expect: () => [
        const AuthLoading(),
        const CreatedUser(userToken: tUserToken),
      ],
      verify: (_) {
        verify(() => googleSignInService()).called(1);
        verify(() => encryptionService.encrypt(tUserToken)).called(1);
        verify(() => mockBrowserInfo.deviceInfo()).called(1);
        verify(() => createUser(tEncryptedDataMap)).called(1);
        verifyNoMoreInteractions(googleSignInService);
        verifyNoMoreInteractions(encryptionService);
        verifyNoMoreInteractions(mockBrowserInfo);
        verifyNoMoreInteractions(createUser);
      },
    );
    //
    // blocTest<AuthBloc, AuthState>(
    //   'should emit [AuthError] when user creation fails',
    //   build: () {
    //     when(() => googleSignInService())
    //         .thenAnswer((_) async => const Right(tUserToken));
    //     when(() => encryptionService.encrypt(tUserToken))
    //         .thenReturn(tEncryptedDataMap);
    //     when(() => createUser(tEncryptedDataMap))
    //         .thenAnswer((_) async => Left(tServerFailure));
    //     return authBloc;
    //   },
    //   act: (bloc) => bloc.add(const CreateUserEvent()),
    //   expect: () => [
    //     const AuthLoading(),
    //     AuthError(tServerFailure.message),
    //   ],
    //   verify: (_) {
    //     verify(() => googleSignInService()).called(1);
    //     verify(() => encryptionService.encrypt(tUserToken)).called(1);
    //     verify(() => createUser(tEncryptedDataMap)).called(1);
    //     verifyNoMoreInteractions(googleSignInService);
    //     verifyNoMoreInteractions(encryptionService);
    //     verifyNoMoreInteractions(createUser);
    //   },
    // );
  });

  group('IsAdminEvent', () {
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AdminCheckStatus] when isAdminEvent is added '
      'and succeeds',
      build: () {
        when(() => isAdmin(any())).thenAnswer(
          (_) async => const Right(true),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const IsAdminEvent(
          userToken: tUserToken,
        ),
      ),
      expect: () => [
        const AuthLoading(),
        const AdminCheckStatus(isAdmin: true),
      ],
      verify: (_) {
        verify(() => isAdmin(tUserToken)).called(1);
        verifyNoMoreInteractions(isAdmin);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthError] when isAdminEvent is added and '
      ' fails',
      build: () {
        when(() => isAdmin(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const IsAdminEvent(
          userToken: tUserToken,
        ),
      ),
      expect: () => [
        const AuthLoading(),
        AuthError(tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => isAdmin(tUserToken)).called(1);
        verifyNoMoreInteractions(isAdmin);
      },
    );
  });
  //
  group('CacheUserTokenEvent', () {
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, CachedUserToken] when CacheUserTokenEvent '
      'is added and succeeds',
      build: () {
        when(() => cacheUserToken(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(const CacheUserTokenEvent(tUserToken)),
      expect: () => [
        const AuthLoading(),
        const CachedUserToken(),
      ],
      verify: (_) {
        verify(() => cacheUserToken(tUserToken)).called(1);
        verifyNoMoreInteractions(cacheUserToken);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, AuthError] when CacheUserTokenEvent is added '
      'and fails',
      build: () {
        when(() => cacheUserToken(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(const CacheUserTokenEvent(tUserToken)),
      expect: () => [
        const AuthLoading(),
        AuthError(tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => cacheUserToken(tUserToken)).called(1);
        verifyNoMoreInteractions(cacheUserToken);
      },
    );
  });

//   fetch user data.
  group('FetchUserDataEvent', () {
    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, FetchedAdminData] when FetchedAdminDataEvent '
      'is added and succeeds',
      build: () {
        when(() => fetchUserData(any())).thenAnswer(
          (_) async => const Right(tAdminDetails),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(FetchAdminDataEvent(userToken: tUserToken)),
      expect: () => [
        const AuthLoading(),
        FetchedAdminData(adminDetails: tAdminDetails),
      ],
      verify: (_) {
        verify(() => fetchUserData(tUserToken)).called(1);
        verifyNoMoreInteractions(fetchUserData);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'should emit [AuthLoading, FetchAdminDetailsError] when '
      'FetchAdminDetailsEvent is added '
      'and fails',
      build: () {
        when(() => fetchUserData(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return authBloc;
      },
      act: (bloc) => bloc.add(
        FetchAdminDataEvent(userToken: tUserToken),
      ),
      expect: () => [
        const AuthLoading(),
        FetchAdminDataError(message: tServerFailure.message),
      ],
      verify: (_) {
        verify(() => fetchUserData(tUserToken)).called(1);
        verifyNoMoreInteractions(fetchUserData);
      },
    );
  });
}
