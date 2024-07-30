import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/datasources/game_search_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/models/game_search_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/repositories/game_search_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGameSearchRemoteDataSources extends Mock
    implements GameSearchRemoteDataSources {}

void main() {
  late MockGameSearchRemoteDataSources remoteDataSource;
  late GameSearchRepoImpl repoImpl;

  setUp(() {
    remoteDataSource = MockGameSearchRemoteDataSources();
    repoImpl = GameSearchRepoImpl(remoteDataSource);
  });

  const tGameSearchResponseModel = GameSearchResponseModel.empty();

  const tGameDataFetchException = ServerException(
    message: 'could not fetch game data',
    statusCode: '404',
  );

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
            userToken: any(named: 'userToken'),
            pageNumber: any(named: 'pageNumber'),
            limit: any(named: 'limit'),
            field: any(named: 'field'),
            query: any(named: 'query'),
          ),
        ).thenAnswer(
          (_) async => tGameSearchResponseModel,
        );

        final result = await repoImpl.searchGames(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
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
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
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
            userToken: any(named: 'userToken'),
            pageNumber: any(named: 'pageNumber'),
            limit: any(named: 'limit'),
            field: any(named: 'field'),
            query: any(named: 'query'),
          ),
        ).thenThrow(
          tGameDataFetchException,
        );

        final result = await repoImpl.searchGames(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
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
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
