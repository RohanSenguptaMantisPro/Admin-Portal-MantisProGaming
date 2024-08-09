import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/repositories/game_search_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'search_games.mapper.dart';

class SearchGames
    extends UsecaseWithParams<GameSearchResponse, SearchGamesParams> {
  const SearchGames(this._repo);

  final GameSearchRepo _repo;

  @override
  ResultFuture<GameSearchResponse> call(SearchGamesParams params) =>
      _repo.searchGames(
        searchGamesParams: params,
      );
}

@MappableClass(discriminatorKey: 'type')
class SearchGamesParams with SearchGamesParamsMappable {
  const SearchGamesParams({
    required this.userToken,
    required this.pageNumber,
    required this.limit,
    required this.field,
    required this.query,
  });

  const SearchGamesParams.empty()
      : this(
          userToken: '',
          limit: '',
          pageNumber: '',
          field: 'field',
          query: 'query',
        );

  final String userToken;
  final String pageNumber;
  final String limit;
  final String field;
  final String query;
}
