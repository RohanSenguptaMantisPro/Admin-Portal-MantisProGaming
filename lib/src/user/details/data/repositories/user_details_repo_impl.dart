import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/datasources/user_details_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/models/user_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/repository/user_details_repo.dart';
import 'package:dartz/dartz.dart';

class UserDetailsRepoImpl implements UserDetailsRepo {
  const UserDetailsRepoImpl(this._remoteDataSource);

  final UserDetailsRemoteDataSources _remoteDataSource;

  @override
  ResultFuture<UserDetails> getUserDetails({
    required String userToken,
    required String userID,
  }) async {
    try {
      final UserDetailsModel result = await _remoteDataSource.getUserDetails(
        userToken: userToken,
        userID: userID,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> updateUserDetails({
    required String userToken,
    required String userID,
    required String accountStatus,
  }) async {
    try {
      await _remoteDataSource.updateUserDetails(
        userToken: userToken,
        userID: userID,
        accountStatus: accountStatus,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
