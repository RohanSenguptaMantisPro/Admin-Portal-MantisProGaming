import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/image_upload.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPushNotificationRepo extends Mock implements PushNotificationRepo {}

void main() {
  late PushNotificationRepo pushNotificationRepo;
  late ImageUpload imageUpload;

  setUp(() {
    pushNotificationRepo = MockPushNotificationRepo();
    imageUpload = ImageUpload(pushNotificationRepo);

    registerFallbackValue(
      File(''),
    );
  });

  const tUserToken = '';
  final tImageFile = File('tImage.jpg');

  test(
    'should call the [PushNotificationRepos.imageUpload]',
    () async {
      when(
        () => pushNotificationRepo.imageUpload(
          userToken: any(named: 'userToken'),
          imageFile: any(named: 'imageFile'),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await imageUpload(
        ImageUploadParams(
          userToken: tUserToken,
          imageFile: tImageFile,
        ),
      );

      expect(
        result,
        equals(
          const Right<dynamic, void>(null),
        ),
      );

      verify(
        () => pushNotificationRepo.imageUpload(
          userToken: tUserToken,
          imageFile: tImageFile,
        ),
      ).called(1);

      verifyNoMoreInteractions(pushNotificationRepo);
    },
  );
}
