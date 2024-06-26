part of 'authentication_bloc.dart';

@MappableClass()
abstract class AuthEvent with AuthEventMappable {
  const AuthEvent();
}

@MappableClass()
class CreateUserEvent extends AuthEvent with CreateUserEventMappable {
  const CreateUserEvent();
}

@MappableClass()
class IsAdminEvent extends AuthEvent with IsAdminEventMappable {
  const IsAdminEvent({required this.userToken});

  final String userToken;
}

@MappableClass()
class CacheUserTokenEvent extends AuthEvent with CacheUserTokenEventMappable {
  const CacheUserTokenEvent(this.userToken);

  final String userToken;
}

@MappableClass()
class IsUserLoggedInEvent extends AuthEvent with IsUserLoggedInEventMappable {
  const IsUserLoggedInEvent();
}

@MappableClass()
class FetchAdminDataEvent extends AuthEvent with FetchAdminDataEventMappable {
  FetchAdminDataEvent({required this.userToken});

  String userToken;
}

@MappableClass()
class LogOutEvent extends AuthEvent with LogOutEventMappable {
  const LogOutEvent();
}
