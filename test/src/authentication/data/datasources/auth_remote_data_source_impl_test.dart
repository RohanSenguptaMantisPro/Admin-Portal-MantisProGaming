import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_http_client.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_local_storage.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_signup_client.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/models/admin_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockCustomHttpClient extends Mock implements CustomHttpClient {}

class MockCustomLocalStorage extends Mock implements CustomLocalStorage {}

class MockCustomSignUpClient extends Mock implements CustomSignUpClient {}

void main() {
  late CustomHttpClient mockCustomHttpClient;
  late CustomLocalStorage mockCustomLocalStorage;
  late CustomSignUpClient mockCustomSignUpClient;
  late AuthRemoteDataSource remoteDataSourceImpl;

  setUp(() {
    mockCustomHttpClient = MockCustomHttpClient();
    mockCustomLocalStorage = MockCustomLocalStorage();
    mockCustomSignUpClient = MockCustomSignUpClient();
    remoteDataSourceImpl = AuthRemoteDataSourceImpl(
      httpClient: mockCustomHttpClient,
      prefs: mockCustomLocalStorage,
      customSignupClient: mockCustomSignUpClient,
    );

    registerFallbackValue(Uri());
  });

  const tUserToken = 'test user token';
  const tAdminDetailsModel = AdminDetailsModel.empty();

  // google signin.
  group('GoogleSignIn', () {
    test('should return userIdToken when Google sign-in is successful',
        () async {
      // Arrange
      when(() => mockCustomSignUpClient.signInSilently())
          .thenAnswer((_) async => tUserToken);

      // Act
      final result = await remoteDataSourceImpl.googleSignInService();

      // Assert
      expect(result, tUserToken);
      verify(() => mockCustomSignUpClient.signInSilently()).called(1);

      verifyNoMoreInteractions(mockCustomSignUpClient);
    });

    test('should throw ServerException when userIdToken is null', () async {
      // Arrange

      when(() => mockCustomSignUpClient.signInSilently())
          .thenAnswer((_) async => '');

      // Act
      final call = remoteDataSourceImpl.googleSignInService;

      // Assert
      expect(
        () async => call(),
        throwsA(
          const ServerException(
            message: 'Could not retrieve userIdToken',
            statusCode: '500',
          ),
        ),
      );
    });
  });

  // createUser.
  group('createUser', () {
    test(
      'should return [String] when the status code is 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.postRequest(
            any(),
            header: any(named: 'header'),
            body: any(named: 'body'),
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

        final methodCall =
            await remoteDataSourceImpl.createUser({'data': 'encryptedData'});

        expect(methodCall, equals(tUserToken));

        verify(
          () => mockCustomHttpClient.postRequest(
            Uri.https('$baseUrl:$testServerPort', kCreateUserEndpoint),
            header: {'Content-Type': 'application/json'},
            body: jsonEncode({'data': 'encryptedData'}),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
      () async {
        when(
          () => mockCustomHttpClient.postRequest(
            any(),
            header: any(named: 'header'),
            body: any(named: 'body'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Could not create user',
            500,
          ),
        );

        final methodCall = remoteDataSourceImpl.createUser;

        expect(
          () async => methodCall({'data': 'encryptedData'}),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              contains('Could not create user'),
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.postRequest(
            Uri.https('$baseUrl:$testServerPort', kCreateUserEndpoint),
            header: {'Content-Type': 'application/json'},
            body: jsonEncode({'data': 'encryptedData'}),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });
//
//   isAdmin Test
  group('isAdmin', () {
    test(
      'should return [true] when [statusCode=200] && [status == "success"].',
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
          () => mockCustomHttpClient.getRequest(
            Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should return [false] when [statusCode!=200] && [status = "failure"].',
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
          () => mockCustomHttpClient.getRequest(
            Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 and [status != failure]',
      () async {
        when(
          () => mockCustomHttpClient.getRequest(
            any(),
            header: any(named: 'header'),
          ),
        ).thenAnswer(
          (_) async => http.Response(
            'Could not check admin status',
            500,
          ),
        );

        final methodCall = remoteDataSourceImpl.isAdmin;

        expect(
          () async => methodCall(tUserToken),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              contains('Could not check admin status'),
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });
//
//   CacheUserToken Tests.
  group('cacheUserToken', () {
    test(
      'should call [SharedPreferences] to cache the data',
      () async {
        when(() => mockCustomLocalStorage.setString(any(), any())).thenAnswer(
          (_) async => true,
        );

        await remoteDataSourceImpl.cacheUserToken(tUserToken);

        verify(
          () => mockCustomLocalStorage.setString(kUserToken, tUserToken),
        ).called(1);
        verifyNoMoreInteractions(mockCustomLocalStorage);
      },
    );

    test(
      'should throw a [CacheException] when there is an error caching the data',
      () async {
        when(
          () => mockCustomLocalStorage.setString(any(), any()),
        ).thenThrow(Exception());

        final methodCall = remoteDataSourceImpl.cacheUserToken;

        expect(
          () async => methodCall(tUserToken),
          throwsA(isA<CacheException>()),
        );

        verify(
          () => mockCustomLocalStorage.setString(kUserToken, tUserToken),
        ).called(1);
        verifyNoMoreInteractions(mockCustomLocalStorage);
      },
    );
  });

//   isUserLoggedIn
  group('isUserLoggedIn', () {
    test(
      'should call [SharedPreferences] to check if user is logged in',
      () async {
        when(
          () => mockCustomLocalStorage.getString(any()),
        ).thenReturn(tUserToken);

        final result = await remoteDataSourceImpl.isUserLoggedIn();

        expect(result, tUserToken);

        verify(() => mockCustomLocalStorage.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(mockCustomLocalStorage);
      },
    );

    test(
      'should return false if there is no data in storage',
      () async {
        when(
          () => mockCustomLocalStorage.getString(any()),
        ).thenReturn(null);

        final result = await remoteDataSourceImpl.isUserLoggedIn();

        expect(result, '');

        verify(() => mockCustomLocalStorage.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(mockCustomLocalStorage);
      },
    );

    test(
      'should throw a [CacheException] when there is an error '
      'retrieving the data',
      () async {
        when(() => mockCustomLocalStorage.getString(any())).thenThrow(
          const CacheException(message: 'something went wrong'),
        );
        final call = remoteDataSourceImpl.isUserLoggedIn;

        expect(
          call,
          throwsA(
            isA<CacheException>(),
          ),
        );
        verify(() => mockCustomLocalStorage.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(mockCustomLocalStorage);
      },
    );
  });
//
//   fetchUserData.
  group('fetchUserData.', () {
    test(
      'should return AdminDetailsModel when the status code is 200 or 201',
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
                'data': {
                  'data': {
                    'accountType': '',
                    'name': '',
                    'email': '',
                    'displayPicture': '',
                  },
                },
              },
            ),
            200,
          ),
        );

        final methodCall = await remoteDataSourceImpl.fetchUserData(tUserToken);

        expect(
          methodCall,
          equals(tAdminDetailsModel),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https('$baseUrl:$testServerPort', kGetAdminDataEndpoint),
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
            'Could not fetch user data',
            500,
          ),
        );

        final methodCall = remoteDataSourceImpl.fetchUserData;

        expect(
          () async => methodCall(tUserToken),
          throwsA(
            isA<ServerException>().having(
              (e) => e.message,
              'message',
              contains('Could not fetch user data'),
            ),
          ),
        );

        verify(
          () => mockCustomHttpClient.getRequest(
            Uri.https('$baseUrl:$testServerPort', kGetAdminDataEndpoint),
            header: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockCustomHttpClient);
      },
    );
  });
//
// //   logOut.
  group('logOut', () {
    test(
      'should call SharedPreferences.clear(), GoogleSignIn.signOut(),'
      ' and GoogleSignIn.disconnect() when logging out',
      () async {
        // Arrange
        when(() => mockCustomLocalStorage.clear())
            .thenAnswer((_) async => true);
        when(() => mockCustomSignUpClient.signOut())
            .thenAnswer((_) async {});
        when(() => mockCustomSignUpClient.disconnect())
            .thenAnswer((_) async {});

        // Act
        await remoteDataSourceImpl.logOut();

        // Assert
        verify(() => mockCustomLocalStorage.clear()).called(1);
        verify(() => mockCustomSignUpClient.signOut()).called(1);
        verify(() => mockCustomSignUpClient.disconnect()).called(1);
      },
    );

    test(
      'should throw CacheException when SharedPreferences.clear() returns false',
      () async {
        // Arrange
        when(() => mockCustomLocalStorage.clear())
            .thenAnswer((_) async => false);

        // Act
        final call = remoteDataSourceImpl.logOut;

        // Assert
        await expectLater(
          call(),
          throwsA(
            isA<CacheException>().having(
              (e) => e.message,
              'message',
              'Could not log user out',
            ),
          ),
        );
        verify(() => mockCustomLocalStorage.clear()).called(1);
        verifyNever(() => mockCustomSignUpClient.signOut());
        verifyNever(() => mockCustomSignUpClient.disconnect());
      },
    );

    test(
      'should throw CacheException when GoogleSignIn.signOut() throws an exception',
      () async {
        // Arrange
        when(() => mockCustomLocalStorage.clear())
            .thenAnswer((_) async => true);
        when(() => mockCustomSignUpClient.signOut())
            .thenThrow(Exception('Sign out failed'));

        // Act
        final call = remoteDataSourceImpl.logOut;

        // Assert
        await expectLater(
          call(),
          throwsA(
            isA<CacheException>().having(
              (e) => e.message,
              'message',
              contains('Sign out failed'),
            ),
          ),
        );
        verify(() => mockCustomLocalStorage.clear()).called(1);
        verify(() => mockCustomSignUpClient.signOut()).called(1);
        verifyNever(() => mockCustomSignUpClient.disconnect());
      },
    );
    //
    test(
      'should throw CacheException when GoogleSignIn.disconnect() throws an exception',
      () async {
        // Arrange
        when(() => mockCustomLocalStorage.clear())
            .thenAnswer((_) async => true);
        when(() => mockCustomSignUpClient.signOut())
            .thenAnswer((_) async {});
        when(() => mockCustomSignUpClient.disconnect())
            .thenThrow(Exception('Disconnect failed'));

        // Act
        final call = remoteDataSourceImpl.logOut;

        // Assert
        await expectLater(
          call(),
          throwsA(isA<CacheException>().having(
            (e) => e.message,
            'message',
            contains('Disconnect failed'),
          )),
        );
        verify(() => mockCustomLocalStorage.clear()).called(1);
        verify(() => mockCustomSignUpClient.signOut()).called(1);
        verify(() => mockCustomSignUpClient.disconnect()).called(1);
      },
    );
  });
}
