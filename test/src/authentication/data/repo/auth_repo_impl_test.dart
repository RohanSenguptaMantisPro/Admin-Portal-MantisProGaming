import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/datasources/auth_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/repo/auth_repo_impl.dart';
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

  // const tPassword = 'Test password';
  // const tFullName = 'Test full name';
  // const tEmail = 'Test email';
  // const tUpdateAction = UpdateUserAction.password;
  // const tUserData = 'New password';
  //
  // const tUser = LocalUserModel.empty();

  const tLoginException = ServerException(
    message: 'Could not log in',
    statusCode: '404',
  );
  const tLoginCheckException = ServerException(
    message: 'Could not check if user is logged in',
    statusCode: '404',
  );
  const tUserToken = 'test user token';

  group('createUser', () {
    test(
      'should return [String] when call to remote source is successful',
      () async {
        when(() => remoteDataSource.createUser()).thenAnswer(
          (_) async => tUserToken,
        );

        final result = await repoImpl.createUser();

        expect(result, equals(const Right<dynamic, String>(tUserToken)));

        verify(() => remoteDataSource.createUser()).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'unsuccessful',
      () async {
        when(() => remoteDataSource.createUser()).thenThrow(
          tLoginException,
        );

        final result = await repoImpl.createUser();

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

        verify(() => remoteDataSource.createUser()).called(1);

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
          (_) async => false,
        );

        final result = await repoImpl.isUserLoggedIn();

        expect(result, equals(const Right<dynamic, bool>(false)));

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
}
