part of 'user_search_bloc.dart';

@MappableClass()
abstract class UserSearchState with UserSearchStateMappable {
  const UserSearchState();
}

@MappableClass()
class UserSearchInitial extends UserSearchState with UserSearchInitialMappable {
  const UserSearchInitial();
}

@MappableClass()
class UserSearchLoading extends UserSearchState with UserSearchLoadingMappable {
  const UserSearchLoading();
}

@MappableClass()
class UserSearchError extends UserSearchState with UserSearchErrorMappable {
  const UserSearchError({required this.message});

  final String message;
}

@MappableClass()
class FetchedUserDetails extends UserSearchState
    with FetchedUserDetailsMappable {
  FetchedUserDetails({required this.userSearchResponse});

  UserSearchResponse userSearchResponse;
}
