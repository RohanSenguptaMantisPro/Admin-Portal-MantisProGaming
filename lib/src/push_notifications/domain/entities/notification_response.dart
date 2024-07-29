import 'package:dart_mappable/dart_mappable.dart';

part 'notification_response.mapper.dart';

@MappableClass(discriminatorKey: 'type')
class NotificationResponse with NotificationResponseMappable {
  const NotificationResponse({
    required this.message,
    required this.success,
    required this.failure,
    required this.errors,
  });

  NotificationResponse.empty()
      : this(
          message: '',
          success: 0,
          failure: 0,
          errors: [const NotificationError.empty()],
        );

  final String message;
  final int success;
  final int failure;
  final List<NotificationError> errors;
}

@MappableClass(discriminatorKey: 'type')
class NotificationError with NotificationErrorMappable {
  const NotificationError({
    required this.token,
    required this.error,
  });

  const NotificationError.empty()
      : this(
          token: '',
          error: '',
        );

  final String token;
  final String error;
}
