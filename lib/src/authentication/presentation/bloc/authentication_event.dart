part of 'authentication_bloc.dart';

// all Mappable are for overriding == with dart_mappable

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
  const IsAdminEvent(this.userToken);

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
