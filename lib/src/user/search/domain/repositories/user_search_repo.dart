import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';

abstract class UserSearchRepo {
  const UserSearchRepo();

  ResultFuture<UserSearchResponse> userSearchResults({
    required String userToken,
    required int pageNumber,
    required int limit,
    required String field,
    required String query,
    required String country,
    required String accountStatus,
  });
}
