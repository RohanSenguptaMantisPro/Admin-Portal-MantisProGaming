import 'dart:convert';

import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/consts.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/models/admin_details_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock
    implements GoogleSignInAuthentication {}

void main() {
  late http.Client mockClient;
  late SharedPreferences mockSharedPreferences;
  late AuthRemoteDataSource remoteDataSourceImpl;
  late GoogleSignIn mockGoogleSignIn;
  late GoogleSignInAccount mockGoogleSignInAccount;
  late GoogleSignInAuthentication mockGoogleSignInAuthentication;

  setUp(() {
    mockClient = MockHttpClient();
    mockSharedPreferences = MockSharedPreferences();
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    remoteDataSourceImpl = AuthRemoteDataSourceImpl(
      httpClient: mockClient,
      prefs: mockSharedPreferences,
      googleSignIn: mockGoogleSignIn,
    );

    when(() => mockGoogleSignIn.signIn())
        .thenAnswer((_) async => mockGoogleSignInAccount);
    when(() => mockGoogleSignInAccount.authentication)
        .thenAnswer((_) async => mockGoogleSignInAuthentication);

    registerFallbackValue(
      Uri(),
    );
  });

  const tUserToken = 'test user token';
  const tAdminDetailsModel = AdminDetailsModel.empty();

  // google signin.
  group('GoogleSignIn', () {
    test('should return userIdToken when Google sign-in is successful',
        () async {
      // Arrange
      when(
        () => mockGoogleSignIn.signInSilently(),
      ).thenAnswer(
        (_) async => mockGoogleSignInAccount,
      );
      when(
        () => mockGoogleSignInAccount.authentication,
      ).thenAnswer(
        (_) async => mockGoogleSignInAuthentication,
      );
      when(() => mockGoogleSignInAuthentication.idToken).thenReturn(tUserToken);

      // Act
      final result = await remoteDataSourceImpl.googleSignInService();

      // Assert
      expect(result, tUserToken);
      verify(() => mockGoogleSignIn.signInSilently()).called(1);
      verify(() => mockGoogleSignInAccount.authentication).called(1);
      verify(() => mockGoogleSignInAuthentication.idToken).called(1);

      verifyNoMoreInteractions(mockGoogleSignIn);
    });

    test('should throw ServerException when userIdToken is null', () async {
      // Arrange

      when(
        () => mockGoogleSignIn.signInSilently(),
      ).thenAnswer(
        (_) async => mockGoogleSignInAccount,
      );
      when(
        () => mockGoogleSignInAccount.authentication,
      ).thenAnswer(
        (_) async => mockGoogleSignInAuthentication,
      );
      when(() => mockGoogleSignInAuthentication.idToken).thenReturn(null);

      // Act
      final call = remoteDataSourceImpl.googleSignInService;

      // Assert
      expect(
        () async => call(),
        throwsA(
          const ServerException(
            message: 'Could not retrieve userIdToken',
            statusCode: '505',
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
              () => mockClient.post(
            any(),
            headers: any(named: 'headers'),
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
              () => mockClient.post(
            Uri.https('$baseUrl:$testServerPort', kCreateUserEndpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'data': 'encryptedData'}),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 or 201',
          () async {
        when(
              () => mockClient.post(
            any(),
            headers: any(named: 'headers'),
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
              () => mockClient.post(
            Uri.https('$baseUrl:$testServerPort', kCreateUserEndpoint),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'data': 'encryptedData'}),
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });

//   isAdmin Test
  group('isAdmin', () {
    test(
      'should return [true] when [statusCode=200] && [status == "success"].',
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
          () => mockClient.get(
            Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should return [false] when [statusCode!=200] && [status = "failure"].',
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
          () => mockClient.get(
            Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );

    test(
      'should throw [ServerException] when the status code is not 200 and [status != failure]',
          () async {
        when(
              () => mockClient.get(
            any(),
            headers: any(named: 'headers'),
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
              () => mockClient.get(
            Uri.https('$baseUrl:$testServerPort', kIsAdminEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });

//   CacheUserToken Tests.
  group('cacheUserToken', () {
    test(
      'should call [SharedPreferences] to cache the data',
      () async {
        when(() => mockSharedPreferences.setString(any(), any())).thenAnswer(
          (_) async => true,
        );

        await remoteDataSourceImpl.cacheUserToken(tUserToken);

        verify(
          () => mockSharedPreferences.setString(kUserToken, tUserToken),
        ).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should throw a [CacheException] when there is an error caching the data',
      () async {
        when(
          () => mockSharedPreferences.setBool(any(), any()),
        ).thenThrow(Exception());

        final methodCall = remoteDataSourceImpl.cacheUserToken;

        expect(
          () async => methodCall(tUserToken),
          throwsA(isA<CacheException>()),
        );

        verify(
          () => mockSharedPreferences.setString(kUserToken, tUserToken),
        ).called(1);
        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

//   isUserLoggedIn
  group('isUserLoggedIn', () {
    test(
      'should call [SharedPreferences] to check if user is logged in',
      () async {
        when(
          () => mockSharedPreferences.getString(any()),
        ).thenReturn(tUserToken);

        final result = await remoteDataSourceImpl.isUserLoggedIn();

        expect(result, tUserToken);

        verify(() => mockSharedPreferences.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should return false if there is no data in storage',
      () async {
        when(
          () => mockSharedPreferences.getString(any()),
        ).thenReturn(null);

        final result = await remoteDataSourceImpl.isUserLoggedIn();

        expect(result, '');

        verify(() => mockSharedPreferences.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );

    test(
      'should throw a [CacheException] when there is an error '
      'retrieving the data',
      () async {
        when(() => mockSharedPreferences.getString(any())).thenThrow(
          const CacheException(message: 'something went wrong'),
        );
        final call = remoteDataSourceImpl.isUserLoggedIn;

        expect(
          call,
          throwsA(
            isA<CacheException>(),
          ),
        );
        verify(() => mockSharedPreferences.getString(kUserToken)).called(1);

        verifyNoMoreInteractions(mockSharedPreferences);
      },
    );
  });

//   fetchUserData.
  group('fetchUserData.', () {
    test(
      'should return AdminDetailsModel when the status code is 200 or 201',
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
          () => mockClient.get(
            Uri.https('$baseUrl:$testServerPort', kGetAdminDataEndpoint),
            headers: {
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
              () => mockClient.get(
            any(),
            headers: any(named: 'headers'),
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
              () => mockClient.get(
            Uri.https('$baseUrl:$testServerPort', kGetAdminDataEndpoint),
            headers: {
              'Authorization': 'Bearer $tUserToken',
            },
          ),
        ).called(1);

        verifyNoMoreInteractions(mockClient);
      },
    );
  });

//   logOut.
  group('logOut', () {
    test(
      'should call SharedPreferences.clear(), GoogleSignIn.signOut(),'
      ' and GoogleSignIn.disconnect() when logging out',
      () async {
        // Arrange
        when(() => mockSharedPreferences.clear()).thenAnswer((_) async => true);
        when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);
        when(() => mockGoogleSignIn.disconnect()).thenAnswer((_) async => null);

        // Act
        await remoteDataSourceImpl.logOut();

        // Assert
        verify(() => mockSharedPreferences.clear()).called(1);
        verify(() => mockGoogleSignIn.signOut()).called(1);
        verify(() => mockGoogleSignIn.disconnect()).called(1);
      },
    );

    test(
      'should throw CacheException when SharedPreferences.clear() returns false',
      () async {
        // Arrange
        when(() => mockSharedPreferences.clear())
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
        verify(() => mockSharedPreferences.clear()).called(1);
        verifyNever(() => mockGoogleSignIn.signOut());
        verifyNever(() => mockGoogleSignIn.disconnect());
      },
    );

    test(
      'should throw CacheException when GoogleSignIn.signOut() throws an exception',
      () async {
        // Arrange
        when(() => mockSharedPreferences.clear()).thenAnswer((_) async => true);
        when(() => mockGoogleSignIn.signOut())
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
        verify(() => mockSharedPreferences.clear()).called(1);
        verify(() => mockGoogleSignIn.signOut()).called(1);
        verifyNever(() => mockGoogleSignIn.disconnect());
      },
    );
    //
    test(
      'should throw CacheException when GoogleSignIn.disconnect() throws an exception',
          () async {
        // Arrange
        when(() => mockSharedPreferences.clear()).thenAnswer((_) async => true);
        when(() => mockGoogleSignIn.signOut()).thenAnswer((_) async => null);
        when(() => mockGoogleSignIn.disconnect()).thenThrow(Exception('Disconnect failed'));

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
        verify(() => mockSharedPreferences.clear()).called(1);
        verify(() => mockGoogleSignIn.signOut()).called(1);
        verify(() => mockGoogleSignIn.disconnect()).called(1);
      },
    );
  });
}
