import 'dart:convert';
import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/server_image_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockUploadToServer extends Mock implements UploadFileToServer {}

void main() {
  late UploadFileToServer mockClient;
  late PushNotificationRemoteDataSources pushNotificationRemoteDataSources;

  setUp(() {
    mockClient = MockUploadToServer();

    pushNotificationRemoteDataSources =
        PushNotificationRemoteDataSourcesImpl(uploadFileToServer: mockClient);

    registerFallbackValue(
      Uri(),
    );

    registerFallbackValue(
      File(''),
    );
  });

  const tUserToken = '';
  final tImageFile = File('');
  const tFileName = '';

  const tTitle = '';
  const tBody = '';

  const tImageUrl =
      'https://$baseFileServerUrl:$port$kNotificationImageDownloadEndpoint/$tFileName';

  final tUploadImageJsonResponse = {
    'status': 'success',
    'message': 'Image has been uploaded.',
  };
  final tUploadImageJsonfailureResponse = {'status': 'failure', 'message': ''};

  final tSendNotificationJsonResponse = {
    'message': 'Notifications Sent Successfully',
  };
  final tSendNotificationfailureResponse = {'status': 'failure', 'message': ''};

  final tServerImageModel = ServerImageModel.empty();

  final tDownloadImageFailureResponse = {
    "status": "failure",
    "message": "error occurred."
  };

  group('imageUpload.', () {
    test(
      'should return [void] when the status code is 200 '
      'or 201',
      () async {
        when(
          () => mockClient.setUri(
            any(),
            any(),
            any(),
          ),
        ).thenAnswer((_) async {});

        when(
          () => mockClient.sendRequest(),
        ).thenAnswer(
          (_) async => http.StreamedResponse(
            Stream.value(utf8.encode(jsonEncode(tUploadImageJsonResponse))),
            200,
          ),
        );

        await pushNotificationRemoteDataSources.imageUpload(
          userToken: tUserToken,
          imageFile: tImageFile,
        );

        verify(
          () => mockClient.setUri(
            Uri.https(
              '$baseFileServerUrl:$port',
              kNotificationImageUploadEndpoint,
            ),
            tUserToken,
            tImageFile,
          ),
        ).called(1);

        verify(
          () => mockClient.sendRequest(),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or '
      '201',
      () async {
        when(
          () => mockClient.setUri(
            any(),
            any(),
            any(),
          ),
        ).thenAnswer(
          (_) async {},
        );
        when(
          () => mockClient.sendRequest(),
        ).thenAnswer(
          (_) async => http.StreamedResponse(
            Stream.value(
              utf8.encode(jsonEncode(tUploadImageJsonfailureResponse)),
            ),
            400,
          ),
        );

        final methodCall = pushNotificationRemoteDataSources.imageUpload;

        //multiple async methods are called so to verify
        // have to properly await.
        await expectLater(
          () async => methodCall(
            userToken: tUserToken,
            imageFile: tImageFile,
          ),
          throwsA(
            isA<ServerException>(),
          ),
        );

        verify(
          () => mockClient.setUri(
            Uri.https(
              '$baseFileServerUrl:$port',
              kNotificationImageUploadEndpoint,
            ),
            tUserToken,
            tImageFile,
          ),
        ).called(1);

        verify(
          () => mockClient.sendRequest(),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });

  //download image.
  group('imageDownload.', () {
    test(
      'should return [ServerImageModel] when the status code is 200 '
      'or 201',
      () async {
        when(
          () => mockClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          //cause this return an image only. not json.
          (_) async => http.Response.bytes(
            [],
            200,
            headers: {
              'Content-Type': '',
            },
          ),
        );

        final methodCall =
            await pushNotificationRemoteDataSources.imageDownload(
          userToken: tUserToken,
          fileName: tFileName,
        );

        expect(
          methodCall,
          equals(tServerImageModel),
        );

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$port',
              '$kNotificationImageDownloadEndpoint/$tFileName',
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or '
      '201',
      () async {
        when(
          () => mockClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(tDownloadImageFailureResponse),
            500,
          ),
        );

        final methodCall = pushNotificationRemoteDataSources.imageDownload;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            fileName: tFileName,
          ),
          throwsA(
            const ServerException(
              message: 'error occurred.',
              statusCode: '500',
            ),
          ),
        );

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$port',
              '$kNotificationImageDownloadEndpoint/$tFileName',
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });

  //send Notifications.
  group('sendNotifications.', () {
    test(
      'should return [void] when the status code is 200 '
      'or 201',
      () async {
        when(
          () => mockClient.postRequest(
            any(),
            header: any(named: 'header'),
            body: any(named: 'body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(tSendNotificationJsonResponse),
            200,
          ),
        );

        await pushNotificationRemoteDataSources.sendNotifications(
          userToken: tUserToken,
          fileName: tFileName,
          title: tTitle,
          body: tBody,
        );

        verify(
          () => mockClient.postRequest(
            Uri.https(
              '$baseUrl:$port',
              kNotificationSendEndpoint,
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
            body: {
              'title': tTitle,
              'body': tBody,
              'imageUrl': tImageUrl,
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or '
      '201',
      () async {
        when(
          () => mockClient.postRequest(
            any(),
            header: any(named: 'header'),
            body: any(named: 'body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(tSendNotificationfailureResponse),
            400,
          ),
        );

        final methodCall = pushNotificationRemoteDataSources.sendNotifications;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            fileName: tFileName,
            title: tTitle,
            body: tBody,
          ),
          throwsA(
            const ServerException(
              message: 'error occurred.',
              statusCode: '500',
            ),
          ),
        );

        verify(
          () => mockClient.postRequest(
            Uri.https(
              '$baseUrl:$port',
              kNotificationSendEndpoint,
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
            body: {
              'title': tTitle,
              'body': tBody,
              'imageUrl': tImageUrl,
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });
}
