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
  late AuthRemoteDataSource remoteDataSourceImpl;

  setUp(() {
    client = MockHttpClient();
    sharedPreferences = MockSharedPreferences();
    remoteDataSourceImpl = AuthRemoteDataSourceImpl(
      httpClient: client,
      prefs: sharedPreferences,
    );
    registerFallbackValue(
      Uri(),
    );
  });

  const tUserToken = 'test user token';

  group('createUser', () {
    test(
      'should return [String] when the status code is 200 or 201',
      () async {
        when(
          () => client.get(
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

        final methodCall = await remoteDataSourceImpl.createUser();

        expect(
          methodCall,
          equals(tUserToken),
        );

        verify(
          () => client.get(
            Uri.https(baseUrl, kCreateUserEndpoint),
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or '
      '201',
      () async {
        when(
          () => client.get(
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

        final methodCall = remoteDataSourceImpl.createUser;

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
          () => client.get(
            Uri.https(baseUrl, kCreateUserEndpoint),
            headers: {'Content-Type': 'application/json'},
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );
  });

//   isAdmin Test
  group('isAdmin', () {
    test(
      'should return [true] when [statusCode=200] && [status == "success"].',
      () async {
        when(
          () => client.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(
              {
                'status': 'success',
                'message': 'Hello mantisprogamin26946083',
              },
            ),
            200,
          ),
        );

        final methodCall = await remoteDataSourceImpl.isAdmin(tUserToken);

        expect(
          methodCall,
          equals(true),
        );

        verify(
          () => client.get(
            Uri.https(baseUrl, kIsAdminEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );

    test(
      'should return [false] when [statusCode!=200] && [status = "failure"].',
      () async {
        when(
          () => client.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(
              {
                'status': 'failure',
                'message': 'not admin',
              },
            ),
            401,
          ),
        );

        final methodCall = await remoteDataSourceImpl.isAdmin(tUserToken);

        expect(
          methodCall,
          equals(false),
        );

        verify(
          () => client.get(
            Uri.https(baseUrl, kIsAdminEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 and '
      '[status != failure] ',
      () async {
        when(
          () => client.get(
            any(),
            headers: any(named: 'headers'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'something went wrong',
            500,
          ),
        );

        final methodCall = remoteDataSourceImpl.isAdmin;

        expect(
          () async => methodCall(tUserToken),
          throwsA(
            const ServerException(
              message: 'something went wrong',
              statusCode: '500',
            ),
          ),
        );

        verify(
          () => client.get(
            Uri.https(baseUrl, kIsAdminEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(client);
      },
    );
  });

//   CacheUserToken Tests.
  group('cacheUserToken', () {
    test(
      'should call [SharedPreferences] to cache the data',
      () async {
        when(() => sharedPreferences.setString(any(), any())).thenAnswer(
          (_) async => true,
        );

        await remoteDataSourceImpl.cacheUserToken(tUserToken);

        verify(
          () => sharedPreferences.setString(kUserToken, tUserToken),
        ).called(1);
        verifyNoMoreInteractions(sharedPreferences);
      },
    );

    test(
      'should throw a [CacheException] when there is an error caching the data',
      () async {
        when(
          () => sharedPreferences.setBool(any(), any()),
        ).thenThrow(Exception());

        final methodCall = remoteDataSourceImpl.cacheUserToken;

        expect(
          () async => methodCall(tUserToken),
          throwsA(isA<CacheException>()),
        );

        verify(
          () => sharedPreferences.setString(kUserToken, tUserToken),
        ).called(1);
        verifyNoMoreInteractions(sharedPreferences);
      },
    );
  });

//   isUserLoggedIn
  group('isUserLoggedIn', () {
    test(
      'should call [SharedPreferences] to check if user is logged in',
      () async {
        when(
          () => sharedPreferences.getString(any()),
        ).thenReturn(tUserToken);

        final result = await remoteDataSourceImpl.isUserLoggedIn();

        expect(result, true);

        verify(() => sharedPreferences.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(sharedPreferences);
      },
    );

    test(
      'should return false if there is no data in storage',
      () async {
        when(
          () => sharedPreferences.getString(any()),
        ).thenReturn(null);

        final result = await remoteDataSourceImpl.isUserLoggedIn();

        expect(result, false);

        verify(() => sharedPreferences.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(sharedPreferences);
      },
    );

    test(
      'should throw a [CacheException] when there is an error '
      'retrieving the data',
      () async {
        when(() => sharedPreferences.getString(any())).thenThrow(
          const CacheException(message: 'something went wrong'),
        );
        final call = remoteDataSourceImpl.isUserLoggedIn;

        expect(
          call,
          throwsA(
            isA<CacheException>(),
          ),
        );
        verify(() => sharedPreferences.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(sharedPreferences);
      },
    );
  });
}
