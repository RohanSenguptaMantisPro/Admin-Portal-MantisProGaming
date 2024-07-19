import 'dart:convert';
import 'dart:io';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/data/datasources/push_notification_remote_data_sources.dart';
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
  const tRequestType = 'POST';
  const tKey = 'image';
  final tImageFile = File('');

  const tUploadImageException = ServerException(
    message: 'could not upload image.',
    statusCode: '404',
  );

  final tUploadImageJsonResponse = jsonEncode(
    {
      'status': 'success',
      'message': 'Image has been uploaded.',
    },
  );

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
        ).thenAnswer(
          (_) async {},
        );

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

    // test(
    //   'should throw [ServerException] when the status code is not 200 or '
    //   '201',
    //   () async {
    //     when(
    //       () => mockClient.post(
    //         any(),
    //         headers: any(named: 'headers'),
    //         body: any(named: 'body'),
    //       ),
    //     ).thenAnswer(
    //       (_) async => http.Response(
    //         'Error',
    //         500,
    //       ),
    //     );
    //
    //     final methodCall = pushNotificationRemoteDataSources.updateUserDetails;
    //
    //     expect(
    //       () async => methodCall(
    //         userToken: tUserToken,
    //         userID: tUserID,
    //         accountStatus: tAccountStatus,
    //       ),
    //       throwsA(
    //         const ServerException(
    //           message: 'Error',
    //           statusCode: '500',
    //         ),
    //       ),
    //     );
    //
    //     verify(
    //       () => mockClient.post(
    //         Uri.https(
    //           '$baseUrl:$port',
    //           '$kUpdateUserDetailsEndpont/$tUserID',
    //         ),
    //         headers: {
    //           'Authorization': 'Bearer $tUserToken',
    //         },
    //         body: {
    //           'accountStatus': tAccountStatus,
    //         },
    //       ),
    //     ).called(1);
    //
    //     verifyNoMoreInteractions(mockClient);
    //   },
    // );
  });
}
