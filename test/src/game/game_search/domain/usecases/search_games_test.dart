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

  setUp(() {
    gameSearchRepo = MockGameSearchRepo();
    searchGames = SearchGames(gameSearchRepo);
  });

  const tUserToken = '';
  const tPageNumber = '';
  const tPageLimit = '';
  const tField = '';
  const tQuery = '';

  const tGameSearchResponse = GameSearchResponse.empty();

  test(
    'should call the [GameSearchRepo.searchGames]',
    () async {
      when(
        () => gameSearchRepo.searchGames(
          userToken: any(named: 'userToken'),
          pageNumber: any(named: 'pageNumber'),
          limit: any(named: 'limit'),
          field: any(named: 'field'),
          query: any(named: 'query'),
        ),
      ).thenAnswer(
        (_) async => const Right(tGameSearchResponse),
      );

      final result = await searchGames(
        const SearchGamesParams(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
        ),
      );

      expect(
        result,
        equals(
          const Right<dynamic, GameSearchResponse>(tGameSearchResponse),
        ),
      );

      verify(
        () => gameSearchRepo.searchGames(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
        ),
      ).called(1);

      verifyNoMoreInteractions(gameSearchRepo);
    },
  );
}
