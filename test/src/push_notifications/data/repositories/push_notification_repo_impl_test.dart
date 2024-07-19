import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/repositories/push_notification_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPushNotificationRemoteDataSources extends Mock
    implements PushNotificationRemoteDataSources {}

void main() {
  late PushNotificationRemoteDataSources remoteDataSource;
  late PushNotificationRepo repoImpl;

  setUp(() {
    remoteDataSource = MockPushNotificationRemoteDataSources();
    repoImpl = PushNotificationRepoImpl(remoteDataSource);

    registerFallbackValue(File(''));
  });

  const tImageUploadException = ServerException(
    message: 'could not upload image',
    statusCode: '404',
  );

  const tUserToken = '';
  final tImageFile = File('tImage.jpg');

  // update user.
  group('imageUpload', () {
    test(
      'should return [void] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.imageUpload(
            userToken: any(named: 'userToken'),
            imageFile: any(named: 'imageFile'),
          ),
        ).thenAnswer(
          (_) async => Future.value(),
        );

        final result = await repoImpl.imageUpload(
          userToken: tUserToken,
          imageFile: tImageFile,
        );

        expect(
          result,
          equals(
            const Right<dynamic, void>(null),
          ),
        );

        verify(
          () => remoteDataSource.imageUpload(
            userToken: tUserToken,
            imageFile: tImageFile,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'failed',
      () async {
        when(
          () => remoteDataSource.imageUpload(
            userToken: any(named: 'userToken'),
            imageFile: any(named: 'imageFile'),
          ),
        ).thenThrow(
          tImageUploadException,
        );

        final result = await repoImpl.imageUpload(
          userToken: tUserToken,
          imageFile: tImageFile,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tImageUploadException.message,
                statusCode: tImageUploadException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.imageUpload(
            userToken: tUserToken,
            imageFile: tImageFile,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
