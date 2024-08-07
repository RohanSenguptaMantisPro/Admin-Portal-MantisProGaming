import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/datasources/user_search_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/models/user_search_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements CustomHttpClient {}

void main() {
  late CustomHttpClient mockClient;
  late UserSearchRemoteDataSources userSearchDataSourceImpl;

  setUp(() {
    mockClient = MockHttpClient();

    userSearchDataSourceImpl = UserSearchDataSourceImpl(
      httpClient: mockClient,
    );

    registerFallbackValue(Uri());
  });

  const tUserToken = '';
  const tPageNumber = '1';
  const tPageLimit = '10';
  const tField = 'name';
  const tQuery = 'sandipan';
  const tCountry = 'india';
  const tAccountStatus = 'unrestricted';
  //the order of the keys of the queryParameters also should match the
  // actual method's else the verify check will fail.
  const queryParameters = {
    'page': tPageNumber,
    'limit': tPageLimit,
    'country': tCountry,
    'accountStatus': tAccountStatus,
    'field': tField,
    'query': tQuery,
  };

  const tUserSearchResponseModel = UserSearchResponseModel.empty();

  group('userSearchResults', () {
    test(
      'should return [UserSearchResponseModel] when the status code is 200 or 201',
      () async {
        when(
          () => mockClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({
              'status': '',
              'page': 1,
              'results': 1,
              'totalResults': 1,
              'data': [
                {
                  '_id': '',
                  'name': '',
                  'userName': '',
                  'email': '',
                }
              ],
            }),
            200,
          ),
        );

        final methodCall = await userSearchDataSourceImpl.userSearchResults(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        );

        expect(methodCall, equals(tUserSearchResponseModel));

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              kUserSearchEndpoint,
              queryParameters,
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
            'Invalid Request',
            500,
          ),
        );

        final methodCall = userSearchDataSourceImpl.userSearchResults;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
            country: tCountry,
            accountStatus: tAccountStatus,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              kUserSearchEndpoint,
              queryParameters,
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
      'should throw [ServerException] when the response data is null or empty',
      () async {
        when(
          () => mockClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({
              'status': '',
              'page': 1,
              'results': 0,
              'totalResults': 0,
              'data': <List<dynamic>>[],
            }),
            200,
          ),
        );

        final methodCall = userSearchDataSourceImpl.userSearchResults;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
            country: tCountry,
            accountStatus: tAccountStatus,
          ),
          throwsA(isA<ServerException>()),
        );

        verify(
          () => mockClient.getRequest(
            Uri.https(
              '$baseUrl:$testServerPort',
              kUserSearchEndpoint,
              queryParameters,
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
}
