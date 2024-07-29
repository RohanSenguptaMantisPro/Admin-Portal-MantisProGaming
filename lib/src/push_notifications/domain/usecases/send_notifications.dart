import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'send_notifications.mapper.dart';

class SendNotifications
    extends UsecaseWithParams<NotificationResponse, SendNotificationsParams> {
  const SendNotifications(this._repo);

  final PushNotificationRepo _repo;

  @override
  ResultFuture<NotificationResponse> call(SendNotificationsParams params) =>
      _repo.sendNotifications(
        userToken: params.userToken,
        title: params.title,
        body: params.body,
        fileName: params.fileName,
      );
}

@MappableClass(discriminatorKey: 'type')
class SendNotificationsParams with SendNotificationsParamsMappable {
  const SendNotificationsParams({
    required this.userToken,
    required this.title,
    required this.body,
    required this.fileName,
  });

  SendNotificationsParams.empty()
      : this(
          userToken: '',
          title: '',
          body: '',
          fileName: '',
        );

  final String userToken;
  final String title;
  final String body;
  final String fileName;
}
