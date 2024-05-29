import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late http.Client client;
  late SharedPreferences sharedPreferences;
  late AuthRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockHttpClient();
    sharedPreferences = MockSharedPreferences();
    remoteDataSource = AuthRemoteDataSourceImpl(
      httpClient: client,
      prefs: sharedPreferences,
    );
    registerFallbackValue(
      Uri(),
    );
    // cause we are sending [Uri()] as [any()] in [when()] function. so Uri is
    // not default datatype we have to mention
    // it using [registerFallbackValue()].
  });

  const tUserToken = 'test user token';

  group('createUser', () {
    test(
      'should complete successfully when the status code is 200 or 201',
      () async {
        when(
          () => client.post(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(
              {
                'status': 'success',
                'token': tUserToken,
              },
            ),
            200,
          ),
        );

        final methodCall = await remoteDataSource.createUser();

        expect(
          methodCall,
          equals(tUserToken),
        );

        verify(
          () => client.post(
            Uri.https(kCreateUserEndpoint),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );

    test(
      'should throw [APIException] when the status code is not 200 or '
      '201',
      () async {
        when(
          () => client.post(
            any(),
            headers: any(
              named: 'headers',
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Could not log user in',
            500,
          ),
        );

        final methodCall = remoteDataSource.createUser;

        expect(
          () async => methodCall(),
          throwsA(
            const ServerException(
              message: 'Could not log user in',
              statusCode: '500',
            ),
          ),
        );

        verify(
          () => client.post(
            Uri.https(kCreateUserEndpoint),
            headers: {'Content-Type': 'application/json'},
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );
  });
}
