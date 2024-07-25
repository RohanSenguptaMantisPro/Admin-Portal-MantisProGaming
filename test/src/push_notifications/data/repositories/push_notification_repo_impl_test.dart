import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/repositories/push_notification_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/repositories/push_notification_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockPushNotificationRemoteDataSources extends Mock
    implements PushNotificationRemoteDataSources {}

void main() {
  late PushNotificationRemoteDataSources remoteDataSource;
  late PushNotificationRepo repoImpl;

  setUp(() {
    remoteDataSource = MockPushNotificationRemoteDataSources();
    repoImpl = PushNotificationRepoImpl(remoteDataSource);

    registerFallbackValue(XFile(''));
  });

  const tImageUploadException = ServerException(
    message: 'could not upload image',
    statusCode: '404',
  );

  const tUserToken = '';
  const tFileName = '';
  const tTitle = '';
  const tBody = '';

  final tImageFile = XFile('');

  final tServerImage = ServerImage.empty();

  const tException = ServerException(message: '', statusCode: '');

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

  // image download.
  group('image download', () {
    test(
      'should return [ServerImage] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.imageDownload(
            userToken: any(named: 'userToken'),
            fileName: any(named: 'fileName'),
          ),
        ).thenAnswer(
          (_) async => tServerImage,
        );

        final result = await repoImpl.imageDownload(
          userToken: tUserToken,
          fileName: tFileName,
        );

        expect(
          result,
          equals(
            Right<dynamic, ServerImage>(
              tServerImage,
            ),
          ),
        );

        verify(
          () => remoteDataSource.imageDownload(
            userToken: tUserToken,
            fileName: tFileName,
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
          () => remoteDataSource.imageDownload(
            userToken: any(named: 'userToken'),
            fileName: any(named: 'fileName'),
          ),
        ).thenThrow(
          tException,
        );

        final result = await repoImpl.imageDownload(
          userToken: tUserToken,
          fileName: tFileName,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tException.message,
                statusCode: tException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.imageDownload(
            userToken: tUserToken,
            fileName: tFileName,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  //send notifications.
  group('sendNotifications', () {
    test(
      'should return [void] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.sendNotifications(
            userToken: any(named: 'userToken'),
            title: any(named: 'title'),
            body: any(named: 'body'),
            fileName: any(named: 'fileName'),
          ),
        ).thenAnswer(
          (_) async => Future.value(),
        );

        final result = await repoImpl.sendNotifications(
          userToken: tUserToken,
          title: tTitle,
          body: tBody,
          fileName: tFileName,
        );

        expect(
          result,
          equals(
            const Right<dynamic, void>(null),
          ),
        );

        verify(
          () => remoteDataSource.sendNotifications(
            userToken: tUserToken,
            title: tTitle,
            body: tBody,
            fileName: tFileName,
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
          () => remoteDataSource.sendNotifications(
            userToken: any(named: 'userToken'),
            title: any(named: 'title'),
            body: any(named: 'body'),
            fileName: any(named: 'fileName'),
          ),
        ).thenThrow(
          tException,
        );

        final result = await repoImpl.sendNotifications(
          userToken: tUserToken,
          title: tTitle,
          body: tBody,
          fileName: tFileName,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tException.message,
                statusCode: tException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.sendNotifications(
            userToken: tUserToken,
            title: tTitle,
            body: tBody,
            fileName: tFileName,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
