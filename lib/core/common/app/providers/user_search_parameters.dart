import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:flutter/cupertino.dart';

class UserSearchParameters extends ChangeNotifier {
  UserSearchResultsParams? _searchParameters;

  UserSearchResultsParams? get searchParameters => _searchParameters;

  void initSearchParams(UserSearchResultsParams params) {
    if (_searchParameters != params) _searchParameters = params;
  }

  set searchParameters(UserSearchResultsParams? params) {
    if (_searchParameters != params) {
      _searchParameters = params;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
