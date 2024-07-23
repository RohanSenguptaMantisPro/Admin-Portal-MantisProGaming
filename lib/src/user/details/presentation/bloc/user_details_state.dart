part of 'user_details_bloc.dart';

@MappableClass()
abstract class UserDetailsState with UserDetailsStateMappable {
  const UserDetailsState();
}

@MappableClass()
class UserDetailsInitial extends UserDetailsState
    with UserDetailsInitialMappable {
  const UserDetailsInitial();
}

@MappableClass()
class GettingUserDetails extends UserDetailsState
    with GettingUserDetailsMappable {
  const GettingUserDetails();
}

@MappableClass()
class UpdatingUserDetails extends UserDetailsState
    with UpdatingUserDetailsMappable {
  const UpdatingUserDetails();
}

@MappableClass()
class GotUserDetails extends UserDetailsState with GotUserDetailsMappable {
  const GotUserDetails({required this.userDetails});

  final UserDetails userDetails;
}

@MappableClass()
class UpdatedUserDetails extends UserDetailsState
    with UpdatedUserDetailsMappable {
  const UpdatedUserDetails();
}

@MappableClass()
class GetUserDetailsError extends UserDetailsState
    with GetUserDetailsErrorMappable {
  const GetUserDetailsError({required this.message});

  final String message;
}

@MappableClass()
class UpdateUserDetailsError extends UserDetailsState
    with UpdateUserDetailsErrorMappable {
  const UpdateUserDetailsError({required this.message});

  final String message;
}
