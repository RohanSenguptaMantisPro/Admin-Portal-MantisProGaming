import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/notification_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/models/server_image_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

class MockUploadToServer extends Mock implements CustomHttpClient {}

void main() {
  late CustomHttpClient mockClient;
  late PushNotificationRemoteDataSources pushNotificationRemoteDataSources;

  setUp(() {
    mockClient = MockUploadToServer();

    pushNotificationRemoteDataSources =
        PushNotificationRemoteDataSourcesImpl(customHttpClient: mockClient);

    registerFallbackValue(
      Uri(),
    );

    registerFallbackValue(
      XFile(''),
    );
  });

  const tUserToken = '';
  final tImageFile = XFile('');
  const tFileName = '';

  const tTitle = '';
  const tBody = '';

  const tImageUrl =
      'https://$baseFileServerUrl:$testServerPort$kNotificationImageDownloadEndpoint/$tFileName';

  final tUploadImageJsonResponse = {
    'status': 'success',
    'message': 'Image has been uploaded.',
  };
  final tUploadImageJsonfailureResponse = {'status': 'failure', 'message': ''};

  final tSendNotificationJsonResponse = {
    "message": "",
    "success": 0,
    "failure": 0,
    "errors": [
      {
        "token": "",
        "error": "",
      },
    ],
  };

  final tSendNotificationfailureResponse = {
    "status": "failure",
    "message": "",
  };

  final tServerImageModel = ServerImageModel.empty();

  final tDownloadImageFailureResponse = {
    "status": "failure",
    "message": "error occurred.",
  };

  final tNotificationResponseModel = NotificationResponseModel.empty();

  group('imageUpload', () {
    test(
      'should return [void] when the status code is 200 or 201',
      () async {
        when(
          () => mockClient.setMultipartRequest(
            uri: any(named: 'uri'),
            userToken: any(named: 'userToken'),
            fields: any(named: 'fields'),
            files: any(named: 'files'),
          ),
        ).thenAnswer((_) async {});

        when(
          () => mockClient.sendRequest(),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(tUploadImageJsonResponse),
            200,
          ),
        );

        await pushNotificationRemoteDataSources.imageUpload(
          userToken: tUserToken,
          imageFile: tImageFile,
        );

        verify(
          () => mockClient.setMultipartRequest(
            uri: Uri.https(
              '$baseFileServerUrl:$testServerPort',
              kNotificationImageUploadEndpoint,
            ),
            userToken: tUserToken,
            files: {'image': tImageFile},
          ),
        ).called(1);

        verify(
          () => mockClient.sendRequest(),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockClient.setMultipartRequest(
            uri: any(named: 'uri'),
            userToken: any(named: 'userToken'),
            fields: any(named: 'fields'),
            files: any(named: 'files'),
          ),
        ).thenAnswer((_) async {});

        when(
          () => mockClient.sendRequest(),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(tUploadImageJsonfailureResponse),
            400,
          ),
        );

        final methodCall = pushNotificationRemoteDataSources.imageUpload;

        await expectLater(
          () => methodCall(
            userToken: tUserToken,
            imageFile: tImageFile,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => mockClient.setMultipartRequest(
            uri: Uri.https(
              '$baseFileServerUrl:$testServerPort',
              kNotificationImageUploadEndpoint,
            ),
            userToken: tUserToken,
            files: {'image': tImageFile},
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
              '$baseFileServerUrl:$testServerPort',
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
              '$baseFileServerUrl:$testServerPort',
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
      'or 201 ',
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

        final response =
            await pushNotificationRemoteDataSources.sendNotifications(
          userToken: tUserToken,
          fileName: tFileName,
          title: tTitle,
          body: tBody,
        );

        expect(response, equals(tNotificationResponseModel));

        verify(
          () => mockClient.postRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
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
      '201 ',
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
              message: '',
              statusCode: '400',
            ),
          ),
        );

        verify(
          () => mockClient.postRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
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
