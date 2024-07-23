part of 'push_notifications_bloc.dart';

@MappableClass()
abstract class PushNotificationEvent with PushNotificationEventMappable {
  const PushNotificationEvent();
}

@MappableClass()
class UploadNotificationImageEvent extends PushNotificationEvent
    with UploadNotificationImageEventMappable {
  UploadNotificationImageEvent({
    required this.userToken,
    required this.imageFile,
  });

  final String userToken;
  final File imageFile;
}

@MappableClass()
class DownloadNotificationImageEvent extends PushNotificationEvent
    with DownloadNotificationImageEventMappable {
  DownloadNotificationImageEvent({
    required this.userToken,
    required this.fileName,
  });

  final String userToken;
  final String fileName;
}

@MappableClass()
class SendNotificationEvent extends PushNotificationEvent
    with SendNotificationEventMappable {
  SendNotificationEvent({
    required this.userToken,
    required this.title,
    required this.body,
    required this.fileName,
  });

  final String userToken;
  final String title;
  final String body;
  final String fileName;
}
