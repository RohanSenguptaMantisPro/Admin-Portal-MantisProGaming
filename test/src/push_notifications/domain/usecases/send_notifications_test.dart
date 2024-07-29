import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/send_notifications.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPushNotificationsRepo extends Mock implements PushNotificationRepo {}

void main() {
  late PushNotificationRepo pushNotificationRepo;
  late SendNotifications sendNotifications;

  setUp(() {
    pushNotificationRepo = MockPushNotificationsRepo();
    sendNotifications = SendNotifications(pushNotificationRepo);
  });

  const tUserToken = '';
  const tFileName = '';
  const tTitle = '';
  const tBody = '';
  const tImageUrl =
      'https://$baseFileServerUrl:$port$kNotificationImageDownloadEndpoint/$tFileName';
  final tNotificationResponse = NotificationResponse.empty();

  test(
    'should call the [PushNotificationRepo.sendNotifications]',
    () async {
      when(
        () => pushNotificationRepo.sendNotifications(
          userToken: any(named: 'userToken'),
          title: any(named: 'title'),
          body: any(named: 'body'),
          fileName: any(named: 'fileName'),
        ),
      ).thenAnswer(
        (_) async => Right(tNotificationResponse),
      );

      final result = await sendNotifications(
        const SendNotificationsParams(
          userToken: tUserToken,
          title: tTitle,
          body: tBody,
          fileName: tFileName,
        ),
      );

      expect(
        result,
        equals(
          Right<dynamic, NotificationResponse>(tNotificationResponse),
        ),
      );

      verify(
        () => pushNotificationRepo.sendNotifications(
          userToken: tUserToken,
          title: tTitle,
          body: tBody,
          fileName: tFileName,
        ),
      ).called(1);

      verifyNoMoreInteractions(pushNotificationRepo);
    },
  );
}
