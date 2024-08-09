import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';

abstract class GameSearchRepo {
  const GameSearchRepo();

  ResultFuture<GameSearchResponse> searchGames({
    required SearchGamesParams searchGamesParams,
  });
}
