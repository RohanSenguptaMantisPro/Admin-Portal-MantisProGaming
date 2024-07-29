import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/image_download.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/image_upload.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/send_notifications.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';
import 'package:image_picker/image_picker.dart';

part 'push_notifications_bloc.mapper.dart';
part 'push_notifications_event.dart';
part 'push_notifications_state.dart';

class PushNotificationBloc
    extends Bloc<PushNotificationEvent, PushNotificationState> {
  PushNotificationBloc({
    required ImageUpload imageUpload,
    required ImageDownload imageDownload,
    required SendNotifications sendNotifications,
  })  : _imageUpload = imageUpload,
        _imageDownload = imageDownload,
        _sendNotifications = sendNotifications,
        super(const PushNotificationInitial()) {
    on<UploadNotificationImageEvent>(_uploadNotificationImageEventHandler);
    on<DownloadNotificationImageEvent>(_downloadNotificationImageEventHandler);
    on<SendNotificationEvent>(_sendNotificationEventHandler);
  }

  final ImageUpload _imageUpload;
  final ImageDownload _imageDownload;
  final SendNotifications _sendNotifications;

  Future<void> _uploadNotificationImageEventHandler(
    UploadNotificationImageEvent event,
    Emitter<PushNotificationState> emit,
  ) async {
    emit(const UploadingNotificationImage());

    final result = await _imageUpload(
      ImageUploadParams(
        userToken: event.userToken,
        imageFile: event.imageFile,
      ),
    );

    result.fold(
      (failure) => emit(PushNotificationError(errorMessage: failure.message)),
      (_) => emit(
        const UploadedNotificationImage(),
      ),
    );
  }

  Future<void> _downloadNotificationImageEventHandler(
    DownloadNotificationImageEvent event,
    Emitter<PushNotificationState> emit,
  ) async {
    emit(const DownloadingNotificationImage());

    final result = await _imageDownload(
      ImageDownloadParams(
        userToken: event.userToken,
        fileName: event.fileName,
      ),
    );

    result.fold(
      (failure) => emit(PushNotificationError(errorMessage: failure.message)),
      (serverImage) => emit(
        DownloadedNotificationImage(serverImage: serverImage),
      ),
    );
  }

  Future<void> _sendNotificationEventHandler(
    SendNotificationEvent event,
    Emitter<PushNotificationState> emit,
  ) async {
    emit(const SendingNotification());

    final result = await _sendNotifications(
      SendNotificationsParams(
        userToken: event.userToken,
        title: event.title,
        body: event.body,
        fileName: event.fileName,
      ),
    );

    result.fold(
      (failure) => emit(PushNotificationError(errorMessage: failure.message)),
      (notificationResponse) => emit(
        NotificationResponseState(notificationResponse: notificationResponse),
      ),
    );
  }
}
