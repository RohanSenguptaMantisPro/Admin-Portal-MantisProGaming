import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
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

  @override
  ResultFuture<ServerImage> imageDownload({
    required String userToken,
    required String fileName,
  }) async {
    try {
      final ServerImage serverImage = await _remoteDataSource.imageDownload(
        userToken: userToken,
        fileName: fileName,
      );
      return Right(serverImage);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> sendNotifications({
    required String userToken,
    required String title,
    required String body,
    required String fileName,
  }) async {
    try {
      await _remoteDataSource.sendNotifications(
        userToken: userToken,
        title: title,
        body: body,
        fileName: fileName,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
