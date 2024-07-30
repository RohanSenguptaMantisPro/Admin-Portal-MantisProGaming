import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:flutter/foundation.dart';

class GameSearchParameters extends ChangeNotifier {
  SearchGamesParams? _searchParameters;

  SearchGamesParams? get searchParameters => _searchParameters;

  void initSearchParams(SearchGamesParams params) {
    if (_searchParameters != params) _searchParameters = params;
  }

  set searchParameters(SearchGamesParams? params) {
    if (_searchParameters != params) {
      _searchParameters = params;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  void updateSearchParam({
    String? userToken,
    String? pageNumber,
    String? limit,
    String? field,
    String? query,
  }) {
    if (_searchParameters == null) return;

    _searchParameters = SearchGamesParams(
      userToken: userToken ?? _searchParameters!.userToken,
      pageNumber: pageNumber ?? _searchParameters!.pageNumber,
      limit: limit ?? _searchParameters!.limit,
      field: field ?? _searchParameters!.field,
      query: query ?? _searchParameters!.query,
    );

    Future.delayed(Duration.zero, notifyListeners);
  }
}
