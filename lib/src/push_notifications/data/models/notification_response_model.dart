import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'notification_response_model.mapper.dart';

@MappableClass(discriminatorValue: 'notificationResponseModel')
class NotificationResponseModel extends NotificationResponse
    with NotificationResponseModelMappable {
  const NotificationResponseModel({
    required super.message,
    required super.success,
    required super.failure,
    required super.errors,
  });

  NotificationResponseModel.empty()
      : this(
          message: '',
          success: 0,
          failure: 0,
          errors: [const NotificationError.empty()],
        );

  static NotificationResponseModel fromJson(String json) =>
      NotificationResponseModelMapper.fromJson(json);
}
