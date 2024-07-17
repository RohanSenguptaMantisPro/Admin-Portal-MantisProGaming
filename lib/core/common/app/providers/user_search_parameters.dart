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

  void updateSearchParam({
    String? userToken,
    String? pageNumber,
    String? limit,
    String? field,
    String? query,
    String? country,
    String? accountStatus,
  }) {
    if (_searchParameters == null) return;

    _searchParameters = UserSearchResultsParams(
      userToken: userToken ?? _searchParameters!.userToken,
      pageNumber: pageNumber ?? _searchParameters!.pageNumber,
      limit: limit ?? _searchParameters!.limit,
      field: field ?? _searchParameters!.field,
      query: query ?? _searchParameters!.query,
      country: country ?? _searchParameters!.country,
      accountStatus: accountStatus ?? _searchParameters!.accountStatus,
    );

    Future.delayed(Duration.zero, notifyListeners);
  }
}
