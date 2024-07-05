import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';

import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/repositories/user_search_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_search_results.mapper.dart';

class UserSearchResults
    extends UsecaseWithParams<UserSearchResponse, UserSearchResultsParams> {
  const UserSearchResults(this._repo);

  final UserSearchRepo _repo;

  @override
  ResultFuture<UserSearchResponse> call(UserSearchResultsParams params) =>
      _repo.userSearchResults(
        userToken: params.userToken,
        pageNumber: params.pageNumber,
        limit: params.limit,
        field: params.field,
        query: params.query,
        country: params.country,
        accountStatus: params.accountStatus,
      );
}

@MappableClass(discriminatorKey: 'type')
class UserSearchResultsParams with UserSearchResultsParamsMappable {
  const UserSearchResultsParams({
    required this.userToken,
    required this.pageNumber,
    required this.limit,
    required this.field,
    required this.query,
    required this.country,
    required this.accountStatus,
  });

  const UserSearchResultsParams.empty()
      : this(
          userToken: '',
          limit: '',
          pageNumber: '',
          field: '',
          query: '',
          country: '',
          accountStatus: '',
        );

  final String userToken;
  final String pageNumber;
  final String limit;
  final String field;
  final String query;
  final String country;
  final String accountStatus;
}
