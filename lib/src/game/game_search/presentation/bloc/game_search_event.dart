part of 'game_search_bloc.dart';



@MappableClass()
abstract class GameSearchEvent with GameSearchEventMappable {
  const GameSearchEvent();
}

@MappableClass()
class SearchGamesEvent extends GameSearchEvent with SearchGamesEventMappable {
  SearchGamesEvent({
    required this.userToken,
    required this.pageNumber,
    required this.limit,
    required this.field,
    required this.query,
  });

  final String userToken;
  final String pageNumber;
  final String limit;
  final String field;
  final String query;
}
