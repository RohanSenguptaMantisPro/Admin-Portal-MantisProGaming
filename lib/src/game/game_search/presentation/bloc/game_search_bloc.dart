import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'game_search_bloc.mapper.dart';

part 'game_search_event.dart';

part 'game_search_state.dart';

class GameSearchBloc extends Bloc<GameSearchEvent, GameSearchState> {
  GameSearchBloc({
    required SearchGames searchGames,
  })  : _searchGames = searchGames,
        super(const GameSearchInitial()) {
    on<GameSearchEvent>((event, emit) {
      emit(const GameSearchLoading());
    });
    on<SearchGamesEvent>(_searchGamesHandler);
  }

  final SearchGames _searchGames;

  Future<void> _searchGamesHandler(
    SearchGamesEvent event,
    Emitter<GameSearchState> emit,
  ) async {
    final result = await _searchGames(
      event.searchGamesParams,
    );

    result.fold(
      (failure) => emit(GameSearchError(message: failure.errorMessage)),
      (gameSearchResponse) => emit(
        FetchedGameData(
          gameSearchResponse: gameSearchResponse,
        ),
      ),
    );
  }
}
