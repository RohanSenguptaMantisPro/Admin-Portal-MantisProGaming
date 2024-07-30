import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/upload_file_to_server.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/datasources/game_search_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/data/models/game_search_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockCustomHttpClient extends Mock implements CustomHttpClient {}

void main() {
  late CustomHttpClient mockCustomHttpClient;
  late GameSearchRemoteDataSources gameSearchDataSourceImpl;

  setUp(() {
    mockCustomHttpClient = MockCustomHttpClient();

    gameSearchDataSourceImpl = GameSearchRemoteDataSourcesImpl(
      customHttpClient: mockCustomHttpClient,
    );

    registerFallbackValue(
      Uri(),
    );
  });

  const tUserToken = 'test user token';
  const tPageNumber = '1';
  const tPageLimit = '10';
  const tField = 'name';
  const tQuery = 'Call of Duty';

  const queryParameters = {
    'page': tPageNumber,
    'limit': tPageLimit,
    'field': tField,
    'query': tQuery,
  };

  const tGameSearchResponseModel = GameSearchResponseModel.empty();

  group('searchGames', () {
    test(
      'should return [GameSearchResponseModel] when the status code is 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
            header: any(named: 'header'),
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
                    'packageName': '',
                    'timesAdded': 0,
                    'timesPlayed': 0,
                    'createdAt': '',
                    'updatedAt': '',
                  }
                ],
              },
            ),
            200,
          ),
        );

        final methodCall = await gameSearchDataSourceImpl.searchGames(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
        );

        expect(
          methodCall,
          equals(tGameSearchResponseModel),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseUrl:$port',
              kGameSearchEndpoint,
              queryParameters,
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Invalid Request',
            500,
          ),
        );

        final methodCall = gameSearchDataSourceImpl.searchGames;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
          ),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              startsWith('Server error: Invalid Request'),
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseUrl:$port',
              kGameSearchEndpoint,
              queryParameters,
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the response data is null or empty',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode({'data': []}),
            200,
          ),
        );

        final methodCall = gameSearchDataSourceImpl.searchGames;

        expect(
          () async => methodCall(
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
          ),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              'No Game Data Available',
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https(
              '$baseUrl:$port',
              kGameSearchEndpoint,
              queryParameters,
            ),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });
}
