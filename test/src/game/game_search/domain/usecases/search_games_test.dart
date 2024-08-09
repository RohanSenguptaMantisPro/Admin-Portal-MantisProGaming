import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/repositories/game_search_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameSearchRepo extends Mock implements GameSearchRepo {}

void main() {
  late GameSearchRepo gameSearchRepo;
  late SearchGames searchGames;

  const tUserToken = '';
  const tPageNumber = '';
  const tPageLimit = '';
  const tField = '';
  const tQuery = '';

  const tGameSearchResponse = GameSearchResponse.empty();

  const tSearchGamesParams = SearchGamesParams.empty();

  setUp(() {
    gameSearchRepo = MockGameSearchRepo();
    searchGames = SearchGames(gameSearchRepo);

    registerFallbackValue(tSearchGamesParams);
  });

  test(
    'should call the [GameSearchRepo.searchGames]',
    () async {
      when(
        () => gameSearchRepo.searchGames(
          searchGamesParams: any(named: 'searchGamesParams'),
        ),
      ).thenAnswer(
        (_) async => const Right(tGameSearchResponse),
      );

      final result = await searchGames(
        tSearchGamesParams,
      );

      expect(
        result,
        equals(
          const Right<dynamic, GameSearchResponse>(tGameSearchResponse),
        ),
      );

      verify(
        () => gameSearchRepo.searchGames(
          searchGamesParams: tSearchGamesParams,
        ),
      ).called(1);

      verifyNoMoreInteractions(gameSearchRepo);
    },
  );
}
