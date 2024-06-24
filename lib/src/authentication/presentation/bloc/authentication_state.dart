part of 'authentication_bloc.dart';

@MappableClass()
abstract class AuthState with AuthStateMappable {
  const AuthState();
}

@MappableClass()
class AuthInitial extends AuthState with AuthInitialMappable {
  const AuthInitial();
}

@MappableClass()
class AuthLoading extends AuthState with AuthLoadingMappable {
  const AuthLoading();
}

@MappableClass()
class AuthError extends AuthState with AuthErrorMappable {
  const AuthError(this.message);

  final String message;
}

@MappableClass()
class CreatedUser extends AuthState with CreatedUserMappable {
  const CreatedUser({required this.userToken});

  final String userToken;
}

@MappableClass()
class AdminCheckStatus extends AuthState with AdminCheckStatusMappable {
  const AdminCheckStatus({required this.isAdmin});

  final bool isAdmin;
}

@MappableClass()
class CachedUserToken extends AuthState with CachedUserTokenMappable {
  const CachedUserToken();
}

@MappableClass()
class CheckingIsUserLoggedIn extends AuthState
    with CheckingIsUserLoggedInMappable {
  const CheckingIsUserLoggedIn();
}

@MappableClass()
class IsLoggedInStatus extends AuthState with IsLoggedInStatusMappable {
  const IsLoggedInStatus({required this.loggedInUserToken});

  final String loggedInUserToken;
}

@MappableClass()
class LoggedInCheckFailed extends AuthState
    with LoggedInCheckFailedMappable {
  const LoggedInCheckFailed();
}
