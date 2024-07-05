import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/datasources/user_search_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/models/user_search_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late http.Client mockClient;
  late UserSearchRemoteDataSources userSearchDataSourceImpl;

  setUp(() {
    mockClient = MockHttpClient();

    userSearchDataSourceImpl = UserSearchDataSourceImpl(
      httpClient: mockClient,
    );

    registerFallbackValue(
      Uri(),
    );
  });

  // can't send empty parameters for test,
  // cause empty parameter checks in the rds method
  // will cause problems.
  const tUserToken = 'test user token';
  const tPageNumber = '1';
  const tPageLimit = '10';
  const tField = 'name';
  const tQuery = 'sandipan';
  const tCountry = 'india';
  const tAccountStatus = 'unrestricted';
  // queryParameters should be same as received parameters
  // by the userSearchResults method
  const queryParameters = {
    'page': tPageNumber,
    'limit': tPageLimit,
    'field': tField,
    'query': tQuery,
    'country': tCountry,
    'accountStatus': tAccountStatus,
  };

  const tUserSearchResponseModel = UserSearchResponseModel.empty();

  const tUserDataFetchException = ServerException(
    message: 'could not fetch user data',
    statusCode: '404',
  );

  group('userSearchResults.', () {
    test(
      'should return [UserSearchResponseModel] when the status code is 200 '
      'or 201',
      () async {
        when(
          () => mockClient.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(
              {
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
              },
            ),
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

        expect(
          methodCall,
          equals(tUserSearchResponseModel),
        );

        verify(
          () => mockClient.get(
            Uri.https(
              '$baseUrl:$port',
              kUserDetailsEndpoint,
              queryParameters,
            ),
            headers: {
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
          () => mockClient.get(
            any(),
            headers: any(named: 'headers'),
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
          throwsA(
            const ServerException(
              message: 'Invalid Request',
              statusCode: '500',
            ),
          ),
        );

        verify(
          () => mockClient.get(
            Uri.https(
              '$baseUrl:$port',
              kUserDetailsEndpoint,
              queryParameters,
            ),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });
}
