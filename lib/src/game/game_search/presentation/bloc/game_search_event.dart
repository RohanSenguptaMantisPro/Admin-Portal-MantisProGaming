part of 'game_search_bloc.dart';

@MappableClass()
abstract class GameSearchEvent with GameSearchEventMappable {
  const GameSearchEvent();
}

@MappableClass()
class SearchGamesEvent extends GameSearchEvent with SearchGamesEventMappable {
  SearchGamesEvent({
    required this.searchGamesParams,
  });

  final SearchGamesParams searchGamesParams;
}
