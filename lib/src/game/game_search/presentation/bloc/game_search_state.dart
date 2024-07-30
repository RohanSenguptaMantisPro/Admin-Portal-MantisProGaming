part of 'game_search_bloc.dart';

@MappableClass()
abstract class GameSearchState with GameSearchStateMappable {
  const GameSearchState();
}

@MappableClass()
class GameSearchInitial extends GameSearchState with GameSearchInitialMappable {
  const GameSearchInitial();
}

@MappableClass()
class GameSearchLoading extends GameSearchState with GameSearchLoadingMappable {
  const GameSearchLoading();
}

@MappableClass()
class GameSearchError extends GameSearchState with GameSearchErrorMappable {
  const GameSearchError({required this.message});

  final String message;
}

@MappableClass()
class FetchedGameData extends GameSearchState with FetchedGameDataMappable {
  FetchedGameData({required this.gameSearchResponse});

  final GameSearchResponse gameSearchResponse;
}
