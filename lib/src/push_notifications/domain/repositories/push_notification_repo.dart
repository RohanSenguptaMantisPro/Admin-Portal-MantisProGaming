import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';

abstract class PushNotificationRepo {
  const PushNotificationRepo();

  ResultFuture<void> imageUpload({
    required String userToken,
    required File imageFile,
  });

//get request for image verification.

//post request for push notification details send.
}
