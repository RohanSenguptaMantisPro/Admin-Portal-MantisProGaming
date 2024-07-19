import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:dartz/dartz.dart';

class PushNotificationRepoImpl implements PushNotificationRepo {
  const PushNotificationRepoImpl(this._remoteDataSource);

  final PushNotificationRemoteDataSources _remoteDataSource;

  @override
  ResultFuture<void> imageUpload({
    required String userToken,
    required File imageFile,
  }) async {
    try {
      await _remoteDataSource.imageUpload(
        userToken: userToken,
        imageFile: imageFile,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
