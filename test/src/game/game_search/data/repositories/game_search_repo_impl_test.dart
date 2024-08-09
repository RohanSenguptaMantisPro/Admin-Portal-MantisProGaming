import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/datasources/game_search_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/models/game_search_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/repositories/game_search_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameSearchRemoteDataSources extends Mock
    implements GameSearchRemoteDataSources {}

void main() {
  late MockGameSearchRemoteDataSources remoteDataSource;
  late GameSearchRepoImpl repoImpl;

  const tGameSearchResponseModel = GameSearchResponseModel.empty();

  const tGameDataFetchException = ServerException(
    message: 'could not fetch game data',
    statusCode: '404',
  );

  const tSearchGamesParams = SearchGamesParams.empty();

  setUp(() {
    remoteDataSource = MockGameSearchRemoteDataSources();
    repoImpl = GameSearchRepoImpl(remoteDataSource);

    registerFallbackValue(tSearchGamesParams);
  });

  const tUserToken = '';
  const tPageNumber = '';
  const tPageLimit = '';
  const tField = '';
  const tQuery = '';

  group('searchGames', () {
    test(
      'should return [GameSearchResponse] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.searchGames(
            searchGamesParams: tSearchGamesParams,
          ),
        ).thenAnswer(
          (_) async => tGameSearchResponseModel,
        );

        final result = await repoImpl.searchGames(
          searchGamesParams: tSearchGamesParams,
        );

        expect(
          result,
          equals(
            const Right<dynamic, GameSearchResponse>(
              tGameSearchResponseModel,
            ),
          ),
        );

        verify(
          () => remoteDataSource.searchGames(
            searchGamesParams: tSearchGamesParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'failed',
      () async {
        when(
          () => remoteDataSource.searchGames(
            searchGamesParams: tSearchGamesParams,
          ),
        ).thenThrow(
          tGameDataFetchException,
        );

        final result = await repoImpl.searchGames(
          searchGamesParams: tSearchGamesParams,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tGameDataFetchException.message,
                statusCode: tGameDataFetchException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.searchGames(
            searchGamesParams: tSearchGamesParams,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
