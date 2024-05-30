part of 'authentication_bloc.dart';

@MappableClass()
abstract class AuthState with AuthStateMappable {
  const AuthState();
}

@MappableClass()
class AuthInitial extends AuthState with AuthInitialMappable{
  const AuthInitial();
}

@MappableClass()
class AuthLoading extends AuthState with AuthLoadingMappable {
  const AuthLoading();
}

class SignedIn extends AuthState {
  const SignedIn(this.user);

  final LocalUser user;

  @override
  List<Object> get props => [user];
}

class SignedUp extends AuthState {
  const SignedUp();
}

class ForgotPasswordSent extends AuthState {
  const ForgotPasswordSent();
}

class UserUpdated extends AuthState {
  const UserUpdated();
}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
