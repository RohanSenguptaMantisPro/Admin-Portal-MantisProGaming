part of 'user_search_bloc.dart';

@MappableClass()
abstract class UserSearchEvent with UserSearchEventMappable {
  const UserSearchEvent();
}

@MappableClass()
class SearchByEvent extends UserSearchEvent with SearchByEventMappable {
  SearchByEvent({
    required this.userToken,
    required this.pageNumber,
    required this.limit,
    required this.field,
    required this.query,
    required this.country,
    required this.accountStatus,
  });

  final String userToken;
  final String pageNumber;
  final String limit;
  final String field;
  final String query;
  final String country;
  final String accountStatus;
}
