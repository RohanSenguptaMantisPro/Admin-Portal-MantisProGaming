import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/presentation/bloc/game_search_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSearchGames extends Mock implements SearchGames {}

void main() {
  late SearchGames searchGames;
  late GameSearchBloc gameSearchBloc;

  const tUserToken = '';
  const tPageNumber = '';
  const tLimit = '';
  const tField = '';
  const tQuery = '';

  const tSearchGamesParams = SearchGamesParams.empty();

  const tGameSearchResponse = GameSearchResponse.empty();

  final tServerFailure = ServerFailure(
    message: 'Failed to fetch game data',
    statusCode: '500',
  );

  setUp(() {
    searchGames = MockSearchGames();
    gameSearchBloc = GameSearchBloc(searchGames: searchGames);
  });

  tearDown(() {
    gameSearchBloc.close();
  });

  test('initial state should be GameSearchInitial', () {
    expect(gameSearchBloc.state, const GameSearchInitial());
  });

  group('SearchGamesEvent', () {
    blocTest<GameSearchBloc, GameSearchState>(
      'should emit [GameSearchLoading, FetchedGameData] when '
      'SearchGamesEvent is added and succeeds',
      build: () {
        when(() => searchGames(tSearchGamesParams))
            .thenAnswer((_) async => const Right(tGameSearchResponse));
        return gameSearchBloc;
      },
      act: (bloc) => bloc.add(
        //parameters of event should be same with parameters sent to usercase.
        SearchGamesEvent(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tLimit,
          field: tField,
          query: tQuery,
        ),
      ),
      expect: () => [
        const GameSearchLoading(),
        FetchedGameData(gameSearchResponse: tGameSearchResponse),
      ],
      verify: (_) {
        verify(() => searchGames(tSearchGamesParams)).called(1);
        verifyNoMoreInteractions(searchGames);
      },
    );

    blocTest<GameSearchBloc, GameSearchState>(
      'should emit [GameSearchLoading, GameSearchError] when SearchGamesEvent is added and fails',
      build: () {
        when(() => searchGames(tSearchGamesParams))
            .thenAnswer((_) async => Left(tServerFailure));
        return gameSearchBloc;
      },
      act: (bloc) => bloc.add(
        SearchGamesEvent(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tLimit,
          field: tField,
          query: tQuery,
        ),
      ),
      expect: () => [
        const GameSearchLoading(),
        GameSearchError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => searchGames(tSearchGamesParams)).called(1);
        verifyNoMoreInteractions(searchGames);
      },
    );
  });
}
