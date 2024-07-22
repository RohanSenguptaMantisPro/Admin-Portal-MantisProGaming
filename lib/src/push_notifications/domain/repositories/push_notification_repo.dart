import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';

abstract class PushNotificationRepo {
  const PushNotificationRepo();

  ResultFuture<void> imageUpload({
    required String userToken,
    required File imageFile,
  });

  //get request for image download.
  ResultFuture<ServerImage> imageDownload({
    required String userToken,
    required String fileName,
  });

//post request for push notification send.
  ResultFuture<void> sendNotifications({
    required String userToken,
    required String title,
    required String body,
    required String fileName,
  });
}
