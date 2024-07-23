part of 'push_notifications_bloc.dart';

@MappableClass()
abstract class PushNotificationState with PushNotificationStateMappable {
  const PushNotificationState();
}

@MappableClass()
class PushNotificationInitial extends PushNotificationState
    with PushNotificationInitialMappable {
  const PushNotificationInitial();
}

@MappableClass()
class PushNotificationError extends PushNotificationState
    with PushNotificationErrorMappable {
  const PushNotificationError({required this.errorMessage});

  final String errorMessage;
}

@MappableClass()
class UploadingNotificationImage extends PushNotificationState
    with UploadingNotificationImageMappable {
  const UploadingNotificationImage();
}

@MappableClass()
class UploadedNotificationImage extends PushNotificationState
    with UploadedNotificationImageMappable {
  const UploadedNotificationImage();
}

@MappableClass()
class DownloadingNotificationImage extends PushNotificationState
    with DownloadingNotificationImageMappable {
  const DownloadingNotificationImage();
}

@MappableClass()
class DownloadedNotificationImage extends PushNotificationState
    with DownloadedNotificationImageMappable {
  const DownloadedNotificationImage({required this.serverImage});

  final ServerImage serverImage;
}

@MappableClass()
class SendingNotification extends PushNotificationState
    with SendingNotificationMappable {
  const SendingNotification();
}

@MappableClass()
class SentNotification extends PushNotificationState
    with SentNotificationMappable {
  const SentNotification();
}
