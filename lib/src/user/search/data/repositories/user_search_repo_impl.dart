import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/datasources/user_search_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/models/user_search_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/repositories/user_search_repo.dart';
import 'package:dartz/dartz.dart';

class UserSearchRepoImpl implements UserSearchRepo {
  const UserSearchRepoImpl(this._remoteDataSource);

  final UserSearchRemoteDataSources _remoteDataSource;

  @override
  ResultFuture<UserSearchResponse> userSearchResults({
    required String userToken,
    required int pageNumber,
    required int limit,
    required String field,
    required String query,
    required String country,
    required String accountStatus,
  }) async {
    try {
      final UserSearchResponseModel result =
          await _remoteDataSource.userSearchResults(
        userToken: userToken,
        pageNumber: pageNumber,
        limit: limit,
        field: field,
        query: query,
        country: country,
        accountStatus: accountStatus,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
