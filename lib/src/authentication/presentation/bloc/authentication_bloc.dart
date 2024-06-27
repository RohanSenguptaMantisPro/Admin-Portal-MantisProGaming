import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/cache_user_token.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/create_user.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/fetch_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/google_sign_in_service.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_admin.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/is_user_logged_in.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/usecases/log_out.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/browser_info.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/utils/encryption_service.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/cupertino.dart';

//generated by dart_mappable
part 'authentication_bloc.mapper.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required GoogleSignInService googleSignInService,
    required CreateUser createUser,
    required IsAdmin isAdmin,
    required CacheUserToken cacheUserToken,
    required IsUserLoggedIn isUserLoggedIn,
    required FetchUserData fetchUserData,
    required LogOut logOut,
    required EncryptionService encryptionService,
    required BrowserInfo browserInfo,
  })  : _googleSignInService = googleSignInService,
        _createUser = createUser,
        _isAdmin = isAdmin,
        _cacheUserToken = cacheUserToken,
        _isUserLoggedIn = isUserLoggedIn,
        _fetchUserData = fetchUserData,
        _logOut = logOut,
        _encryptionService = encryptionService,
        _browserInfo = browserInfo,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<CreateUserEvent>(_createUserHandler);
    on<IsAdminEvent>(_isAdminHandler);
    on<CacheUserTokenEvent>(_cacheUserTokenHandler);
    on<IsUserLoggedInEvent>(_isUserLoggedInHandler);
    on<FetchAdminDataEvent>(_fetchUserDataHandler);
    on<LogOutEvent>(_logOutHandler);
  }

  final GoogleSignInService _googleSignInService;
  final CreateUser _createUser;
  final IsAdmin _isAdmin;
  final CacheUserToken _cacheUserToken;
  final IsUserLoggedIn _isUserLoggedIn;
  final FetchUserData _fetchUserData;
  final LogOut _logOut;
  final EncryptionService _encryptionService;
  final BrowserInfo _browserInfo;

  Future<void> _createUserHandler(
    CreateUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    // google signin call.
    final userIdToken = await _googleSignInService();

    // await before fold and then both results are asynced
    // due to nested calls and handling asynchronous methods
    // properly.

    await userIdToken.fold((failure) async {
      emit(AuthError(failure.message));
    }, (idToken) async {
      // encryption.
      final DataMap? encryptedDataMap = _encryptionService.encrypt(idToken);

      if (encryptedDataMap == null) {
        emit(const AuthError('Error in encryption.'));
        return;
      }

      //   accessing device info utils method call.
      final DataMap? systemInfo = await _browserInfo.deviceInfo();
      if (systemInfo == null) {
        emit(const AuthError('Error in encryption.'));
        return;
      }

      debugPrint('--------encryptedDataMap : $encryptedDataMap');
      debugPrint('--------systemInfo : $systemInfo');

      // create user http call.
      final createdUserToken =
          await _createUser({...encryptedDataMap, ...systemInfo});
      // merged two maps.

      await createdUserToken.fold(
        (failure) async {
          emit(AuthError(failure.message));
        },
        (createdUserToken) async {
          emit(CreatedUser(userToken: createdUserToken));
        },
      );
    });
  }

  Future<void> _isAdminHandler(
    IsAdminEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _isAdmin(event.userToken);
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (isUserAdmin) => emit(AdminCheckStatus(isAdmin: isUserAdmin)),
    );
  }

  Future<void> _cacheUserTokenHandler(
    CacheUserTokenEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _cacheUserToken(event.userToken);
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const CachedUserToken()),
    );
  }

  Future<void> _isUserLoggedInHandler(
    IsUserLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const CheckingIsUserLoggedIn());

    final result = await _isUserLoggedIn();
    result.fold(
      (failure) => emit(const LoggedInCheckFailed()),
      (isUserLoggedIn) =>
          emit(IsLoggedInStatus(loggedInUserToken: isUserLoggedIn)),
    );
  }

  Future<void> _fetchUserDataHandler(
    FetchAdminDataEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _fetchUserData(event.userToken);
    result.fold(
      (failure) => emit(FetchAdminDataError(message: failure.message)),
      (adminDetails) => emit(FetchedAdminData(adminDetails: adminDetails)),
    );
  }

  Future<void> _logOutHandler(
    LogOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _logOut();
    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const LoggedOut()),
    );
  }
}
