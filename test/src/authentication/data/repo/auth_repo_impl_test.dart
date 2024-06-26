import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/models/admin_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/repo/auth_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

void main() {
  late MockAuthRemoteDataSource remoteDataSource;
  late AuthRepoImpl repoImpl;

  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repoImpl = AuthRepoImpl(remoteDataSource);
  });

  const tAdminDetailsModel = AdminDetailsModel.empty();
  const tAdminDetails = AdminDetails.empty();

  const tLoginException = ServerException(
    message: 'Could not log in',
    statusCode: '404',
  );
  const tLoginCheckException = ServerException(
    message: 'Could not check if user is logged in',
    statusCode: '404',
  );
  const tFetchAdminDataException = ServerException(
    message: 'Could not fetch user data',
    statusCode: '404',
  );

  const tUserToken = 'test user token';

  group('googleSignInService', () {
    test(
      'should return [String] when call to remote source is successful',
      () async {
        when(() => remoteDataSource.googleSignInService()).thenAnswer(
          (_) async => tUserToken,
        );

        final result = await repoImpl.googleSignInService();

        expect(result, equals(const Right<dynamic, String>(tUserToken)));

        verify(() => remoteDataSource.googleSignInService()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.googleSignInService()).thenThrow(
          tLoginException,
        );

        final result = await repoImpl.googleSignInService();

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not log in',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.googleSignInService()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('createUser', () {
    test(
      'should return [String] when call to remote source is successful',
      () async {
        when(() => remoteDataSource.createUser(any())).thenAnswer(
          (_) async => tUserToken,
        );

        final result = await repoImpl.createUser({'data': 'encryptedData'});

        expect(result, equals(const Right<dynamic, String>(tUserToken)));

        verify(() => remoteDataSource.createUser({'data': 'encryptedData'}))
            .called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.createUser(any())).thenThrow(
          tLoginException,
        );

        final result = await repoImpl.createUser({'data': 'encryptedData'});

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not log in',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.createUser({'data': 'encryptedData'}))
            .called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('isAdmin', () {
    test(
      'should return [bool] when call to remote source is successful',
      () async {
        when(() => remoteDataSource.isAdmin(any())).thenAnswer(
          (_) async => true,
        );

        final result = await repoImpl.isAdmin(tUserToken);

        expect(result, equals(const Right<dynamic, bool>(true)));

        verify(() => remoteDataSource.isAdmin(tUserToken)).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.isAdmin(any())).thenThrow(
          tLoginException,
        );

        final result = await repoImpl.isAdmin(tUserToken);

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not log in',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.isAdmin(tUserToken)).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('cacheUserToken', () {
    test(
      'should return [void] when call to remote source is successful',
      () async {
        when(() => remoteDataSource.cacheUserToken(any())).thenAnswer(
          (_) async => Future.value(),
        );

        final result = await repoImpl.cacheUserToken(tUserToken);

        expect(result, equals(const Right<dynamic, void>(null)));

        verify(() => remoteDataSource.cacheUserToken(tUserToken)).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.cacheUserToken(any())).thenThrow(
          tLoginException,
        );

        final result = await repoImpl.cacheUserToken(tUserToken);

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not log in',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.cacheUserToken(tUserToken)).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  group('isUserLoggedIn', () {
    test(
      'should return [false] when call to remote source is successful',
      () async {
        when(() => remoteDataSource.isUserLoggedIn()).thenAnswer(
          (_) async => tUserToken,
        );

        final result = await repoImpl.isUserLoggedIn();

        expect(result, equals(const Right<dynamic, String>(tUserToken)));

        verify(() => remoteDataSource.isUserLoggedIn()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.isUserLoggedIn()).thenThrow(
          tLoginCheckException,
        );

        final result = await repoImpl.isUserLoggedIn();

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not check if user is logged in',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.isUserLoggedIn()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  // fetchUserData.
  group('fetchUserData', () {
    test(
      'should return [AdminDetailsModel] when call to remote source is '
      'successful',
      () async {
        when(() => remoteDataSource.fetchUserData(any())).thenAnswer(
          (_) async => tAdminDetailsModel,
        );

        final result = await repoImpl.fetchUserData(tUserToken);

        expect(
          result,
          equals(
            const Right<dynamic, AdminDetails>(tAdminDetailsModel),
          ),
        );

        verify(() => remoteDataSource.fetchUserData(tUserToken)).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.fetchUserData(any())).thenThrow(
          tFetchAdminDataException,
        );

        final result = await repoImpl.fetchUserData(tUserToken);

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not fetch user data',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.fetchUserData(tUserToken)).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  //logout.
  group('logOut', () {
    test(
      'should return [void] when call to remote source is '
      'successful',
      () async {
        when(() => remoteDataSource.logOut()).thenAnswer(
          (_) async => Future.value(),
        );

        final result = await repoImpl.logOut();

        expect(
          result,
          equals(
            const Right<dynamic, void>(null),
          ),
        );

        verify(() => remoteDataSource.logOut()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.logOut()).thenThrow(
          const ServerException(
            message: 'Could not log user out',
            statusCode: '404',
          ),
        );

        final result = await repoImpl.logOut();

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: 'Could not log user out',
                statusCode: '404',
              ),
            ),
          ),
        );

        verify(() => remoteDataSource.logOut()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
