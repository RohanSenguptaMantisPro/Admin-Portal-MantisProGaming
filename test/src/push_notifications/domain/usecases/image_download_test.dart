import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/image_download.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPushNotificationRepo extends Mock implements PushNotificationRepo {}

void main() {
  late PushNotificationRepo pushNotificationRepo;
  late ImageDownload imageDownload;

  setUp(() {
    pushNotificationRepo = MockPushNotificationRepo();
    imageDownload = ImageDownload(pushNotificationRepo);
  });

  const tUserToken = '';
  const tFileName = '';

  final tServerImage = ServerImage.empty();

  test(
    'should call the [PushNotificationRepos.imageDownload]',
    () async {
      when(
        () => pushNotificationRepo.imageDownload(
          userToken: any(named: 'userToken'),
          fileName: any(named: 'fileName'),
        ),
      ).thenAnswer(
        (_) async => Right(tServerImage),
      );

      final result = await imageDownload(
        const ImageDownloadParams(
          userToken: tUserToken,
          fileName: tFileName,
        ),
      );

      expect(
        result,
        equals(
          Right<dynamic, ServerImage>(tServerImage),
        ),
      );

      verify(
        () => pushNotificationRepo.imageDownload(
          userToken: tUserToken,
          fileName: tFileName,
        ),
      ).called(1);

      verifyNoMoreInteractions(pushNotificationRepo);
    },
  );
}
