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
class UserDetailsLoading extends UserDetailsState
    with UserDetailsLoadingMappable {
  const UserDetailsLoading();
}

@MappableClass()
class UserDetailsError extends UserDetailsState with UserDetailsErrorMappable {
  const UserDetailsError({required this.message});

  final String message;
}

@MappableClass()
class FetchedUserDetails extends UserDetailsState
    with FetchedUserDetailsMappable {
  FetchedUserDetails({required this.userDetails});

  UserDetails userDetails;
}

@MappableClass()
class UpdatingUserDetails extends UserDetailsState
    with UpdatingUserDetailsMappable {
  UpdatingUserDetails();
}

@MappableClass()
class UpdatedUserDetails extends UserDetailsState
    with UpdatedUserDetailsMappable {
  UpdatedUserDetails();
}
