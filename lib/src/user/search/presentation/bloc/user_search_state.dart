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
class FetchedUserData extends UserSearchState
    with FetchedUserDataMappable {
  FetchedUserData({required this.userSearchResponse});

  UserSearchResponse userSearchResponse;
}
