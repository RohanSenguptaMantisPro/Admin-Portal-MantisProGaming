part of 'user_details_bloc.dart';

@MappableClass()
abstract class UserDetailsEvent with UserDetailsEventMappable {
  const UserDetailsEvent();
}

@MappableClass()
class GetUserDetailsEvent extends UserDetailsEvent
    with GetUserDetailsEventMappable {
  GetUserDetailsEvent({
    required this.userToken,
    required this.userID,
  });

  final String userToken;
  final String userID;
}

@MappableClass()
class UpdateUserDetailsEvent extends UserDetailsEvent
    with UpdateUserDetailsEventMappable {
  UpdateUserDetailsEvent({
    required this.userToken,
    required this.userID,
    required this.accountStatus,
  });

  final String userToken;
  final String userID;
  final String accountStatus;
}
