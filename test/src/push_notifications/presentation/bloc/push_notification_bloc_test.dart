import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/notification_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/entities/server_image.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/image_download.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/image_upload.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/domain/usecases/send_notifications.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/bloc/push_notifications_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockImageUpload extends Mock implements ImageUpload {}

class MockImageDownload extends Mock implements ImageDownload {}

class MockSendNotifications extends Mock implements SendNotifications {}

void main() {
  late ImageUpload imageUpload;
  late ImageDownload imageDownload;
  late SendNotifications sendNotifications;

  late PushNotificationBloc pushNotificationBloc;

  setUp(() {
    imageUpload = MockImageUpload();
    imageDownload = MockImageDownload();
    sendNotifications = MockSendNotifications();

    pushNotificationBloc = PushNotificationBloc(
      imageUpload: imageUpload,
      imageDownload: imageDownload,
      sendNotifications: sendNotifications,
    );
  });

  const tUserToken = '';
  final tImageFile = XFile('');
  const tFileName = '';
  const tTitle = '';
  const tBody = '';

  // here can't use ImageUploadParams.empty in [verify]
  // because the File('') used in there
  // and received here in the event(tImageFile)
  // both are different instantiations of File class.
  // so its not matched with values but with reference.
  final tImageUploadParams = ImageUploadParams.empty();
  final tImageDownloadParams = ImageDownloadParams.empty();
  final tSendNotificationParams = SendNotificationsParams.empty();
  final tNotificationResponse = NotificationResponse.empty();

  final tServerFailure = ServerFailure(
    message: '',
    statusCode: '',
  );

  final tServerImage = ServerImage.empty();

  setUpAll(() {
    registerFallbackValue(tImageUploadParams);
    registerFallbackValue(tImageDownloadParams);
    registerFallbackValue(tSendNotificationParams);
  });

  tearDown(() => pushNotificationBloc.close());

  test('initialState should be [PushNotificationInitial()]', () {
    expect(pushNotificationBloc.state, const PushNotificationInitial());
  });

  group('ImageUpload', () {
    blocTest<PushNotificationBloc, PushNotificationState>(
      'should emit [UploadingNotificationImage(), UploadedNotificationImage()]'
      ' when [ImageUploadEvent] '
      'is added and succeeds',
      build: () {
        when(() => imageUpload(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return pushNotificationBloc;
      },
      act: (bloc) => bloc.add(
        UploadNotificationImageEvent(
          userToken: tUserToken,
          imageFile: tImageFile,
        ),
      ),
      expect: () => [
        const UploadingNotificationImage(),
        const UploadedNotificationImage(),
      ],
      verify: (_) {
        verify(
          () => imageUpload(
            // here can't use ImageUploadParams.empty
            // because the File('') used in there
            // and received here in the event(tImageFile)
            // both are different instantiations of File class.
            // so its not matched with values but with reference.
            ImageUploadParams(
              userToken: tUserToken,
              imageFile: tImageFile,
            ),
          ),
        ).called(1);
        verifyNoMoreInteractions(imageUpload);
      },
    );

    blocTest<PushNotificationBloc, PushNotificationState>(
      'should emit [UploadingNotificationImage(), PushNotificationError()] '
      'when '
      'ImageUploadEvent is added '
      'and fails',
      build: () {
        when(() => imageUpload(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return pushNotificationBloc;
      },
      act: (bloc) => bloc.add(
        UploadNotificationImageEvent(
          userToken: tUserToken,
          imageFile: tImageFile,
        ),
      ),
      expect: () => [
        const UploadingNotificationImage(),
        PushNotificationError(errorMessage: tServerFailure.message),
      ],
      verify: (_) {
        verify(
          () => imageUpload(
            ImageUploadParams(
              userToken: tUserToken,
              imageFile: tImageFile,
            ),
          ),
        ).called(1);
        verifyNoMoreInteractions(imageUpload);
      },
    );
  });

  //image download.
  group('ImageDownload', () {
    blocTest<PushNotificationBloc, PushNotificationState>(
      'should emit [DownloadingNotificationImage(),'
      ' DownloadedNotificationImage()]'
      ' when [ImageDownloadEvent] '
      'is added and succeeds',
      build: () {
        when(() => imageDownload(any())).thenAnswer(
          (_) async => Right(tServerImage),
        );
        return pushNotificationBloc;
      },
      act: (bloc) => bloc.add(
        DownloadNotificationImageEvent(
          userToken: tUserToken,
          fileName: tFileName,
        ),
      ),
      expect: () => [
        const DownloadingNotificationImage(),
        DownloadedNotificationImage(serverImage: tServerImage),
      ],
      verify: (_) {
        verify(
          () => imageDownload(
            tImageDownloadParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(imageUpload);
      },
    );

    blocTest<PushNotificationBloc, PushNotificationState>(
      'should emit [UploadingNotificationImage(), PushNotificationError()] '
      'when '
      'ImageUploadEvent is added '
      'and fails',
      build: () {
        when(() => imageDownload(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return pushNotificationBloc;
      },
      act: (bloc) => bloc.add(
        DownloadNotificationImageEvent(
          userToken: tUserToken,
          fileName: tFileName,
        ),
      ),
      expect: () => [
        const DownloadingNotificationImage(),
        PushNotificationError(errorMessage: tServerFailure.message),
      ],
      verify: (_) {
        verify(
          () => imageDownload(
            tImageDownloadParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(imageUpload);
      },
    );
  });

  //send notifications.
  group('sendNotifications', () {
    blocTest<PushNotificationBloc, PushNotificationState>(
      'should emit [SendingNotification(),'
      ' SentNotification()]'
      ' when [SendNotificationEvent()] '
      'is added and succeeds',
      build: () {
        when(() => sendNotifications(any())).thenAnswer(
          (_) async => Right(tNotificationResponse),
        );
        return pushNotificationBloc;
      },
      act: (bloc) => bloc.add(
        SendNotificationEvent(
          userToken: tUserToken,
          fileName: tFileName,
          title: tTitle,
          body: tBody,
        ),
      ),
      expect: () => [
        const SendingNotification(),
        NotificationResponseState(notificationResponse: tNotificationResponse),
      ],
      verify: (_) {
        verify(
          () => sendNotifications(
            tSendNotificationParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(imageUpload);
      },
    );

    blocTest<PushNotificationBloc, PushNotificationState>(
      'should emit [SendingNotification(), PushNotificationError()] '
      'when '
      'SendNotificationEvent is added '
      'and fails',
      build: () {
        when(() => sendNotifications(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return pushNotificationBloc;
      },
      act: (bloc) => bloc.add(
        SendNotificationEvent(
          userToken: tUserToken,
          fileName: tFileName,
          title: tTitle,
          body: tBody,
        ),
      ),
      expect: () => [
        const SendingNotification(),
        PushNotificationError(errorMessage: tServerFailure.message),
      ],
      verify: (_) {
        verify(
          () => sendNotifications(
            tSendNotificationParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(imageUpload);
      },
    );
  });
}
