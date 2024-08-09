import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/datasources/game_search_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/models/game_search_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/repositories/game_search_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:dartz/dartz.dart';

class GameSearchRepoImpl implements GameSearchRepo {
  const GameSearchRepoImpl(this._remoteDataSource);

  final GameSearchRemoteDataSources _remoteDataSource;

  @override
  ResultFuture<GameSearchResponse> searchGames({
    required SearchGamesParams searchGamesParams,
  }) async {
    try {
      final GameSearchResponseModel result =
          await _remoteDataSource.searchGames(
        searchGamesParams: searchGamesParams,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
