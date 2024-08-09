import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/datasources/user_details_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/models/user_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements CustomHttpClient {}

void main() {
  late CustomHttpClient mockClient;
  late UserDetailsRemoteDataSources userDetailsRemoteDataSources;

  setUp(() {
    mockClient = MockHttpClient();

    userDetailsRemoteDataSources = UserDetailsDataScourceImpl(
      httpClient: mockClient,
    );

    registerFallbackValue(Uri());
  });

  const tUserToken = '';
  const tUserID = '';
  const tAccountStatus = '';

  const tUserDetailsModel = UserDetailsModel.empty();

  final tGetUserDetailsJsonResponse = jsonEncode({
    'status': 'success',
    'data': {
      'userEvents': <List<String>>[],
      '_id': '',
      'accountType': '',
      'name': '',
      'userName': '',
      'googleId': '',
      'email': '',
      'emailVerified': false,
      'displayPicture': '',
      'role': 0,
      'locale': '',
      'country': '',
      'pairedDevices': <List<String>>[],
      'creditsAvailable': 0,
      'gameMappings': <List<String>>[],
      'accountActive': false,
      'accountStatus': '',
      'createdAt': '',
      'updatedAt': '',
      '__v': 0,
    },
  });
  final tUpdateUserDetailsJsonResponse = jsonEncode({
    'status': 'success',
    'message': 'User has been successfully updated',
  });

  group('getUserDetails', () {
    test(
      'should return [UserDetailsModel] when the status code is 200 or 201',
      () async {
        when(
          () => mockClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            tGetUserDetailsJsonResponse,
            200,
          ),
        );

        final methodCall = await userDetailsRemoteDataSources.getUserDetails(
          userToken: tUserToken,
          userID: tUserID,
        );

        expect(methodCall, equals(tUserDetailsModel));

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kGetUserDetailsEndpoint/$tUserID',
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
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Error',
            500,
          ),
        );

        final methodCall = userDetailsRemoteDataSources.getUserDetails;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            userID: tUserID,
          ),
          throwsA(
            isA<ServerException>(),
          ),
        );

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kGetUserDetailsEndpoint/$tUserID',
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

  group('updateUserDetails', () {
    test(
      'should complete successfully when the status code is 200 or 201',
      () async {
        when(
          () => mockClient.postRequest(
            any(),
            header: any(named: 'header'),
            body: any(named: 'body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            tUpdateUserDetailsJsonResponse,
            200,
          ),
        );

        await expectLater(
          userDetailsRemoteDataSources.updateUserDetails(
            userToken: tUserToken,
            userID: tUserID,
            accountStatus: tAccountStatus,
          ),
          completes,
        );

        verify(
          () => mockClient.postRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kUpdateUserDetailsEndpont/$tUserID',
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
            body: {
              'accountStatus': tAccountStatus,
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockClient.postRequest(
            any(),
            header: any(named: 'header'),
            body: any(named: 'body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Error',
            500,
          ),
        );

        final methodCall = userDetailsRemoteDataSources.updateUserDetails;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            userID: tUserID,
            accountStatus: tAccountStatus,
          ),
          throwsA(
            isA<ServerException>(),
          ),
        );

        verify(
          () => mockClient.postRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              '$kUpdateUserDetailsEndpont/$tUserID',
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
            body: {
              'accountStatus': tAccountStatus,
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });
}
