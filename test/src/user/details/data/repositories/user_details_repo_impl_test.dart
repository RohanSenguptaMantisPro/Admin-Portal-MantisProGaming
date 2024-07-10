import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/datasources/user_details_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/models/user_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/data/repositories/user_details_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDetailsRemoteDataSources extends Mock
    implements UserDetailsRemoteDataSources {}

void main() {
  late UserDetailsRemoteDataSources remoteDataSource;
  late UserDetailsRepoImpl repoImpl;

  setUp(() {
    remoteDataSource = MockUserDetailsRemoteDataSources();
    repoImpl = UserDetailsRepoImpl(remoteDataSource);
  });

  const tUserDetailsModel = UserDetailsModel.empty();

  const tUserDetailsFetchException = ServerException(
    message: 'could not fetch user data',
    statusCode: '404',
  );
  const tUpdateUserDetailsException = ServerException(
    message: 'could not update user data',
    statusCode: '404',
  );

  const tUserToken = '';
  const tUserID = '';
  const tAccountStatus = '';

  // get user details.
  group('getUserDetails', () {
    test(
      'should return [UserDetailsModel] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.getUserDetails(
            userToken: any(named: 'userToken'),
            userID: any(named: 'userID'),
          ),
        ).thenAnswer(
          (_) async => tUserDetailsModel,
        );

        final result = await repoImpl.getUserDetails(
          userToken: tUserToken,
          userID: tUserID,
        );

        expect(
          result,
          equals(
            const Right<dynamic, UserDetails>(
              tUserDetailsModel,
            ),
          ),
        );

        verify(
          () => remoteDataSource.getUserDetails(
            userToken: tUserToken,
            userID: tUserID,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'failed',
      () async {
        when(
          () => remoteDataSource.getUserDetails(
            userToken: any(named: 'userToken'),
            userID: any(named: 'userID'),
          ),
        ).thenThrow(
          tUserDetailsFetchException,
        );

        final result = await repoImpl.getUserDetails(
          userToken: tUserToken,
          userID: tUserID,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tUserDetailsFetchException.message,
                statusCode: tUserDetailsFetchException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.getUserDetails(
            userToken: tUserToken,
            userID: tUserID,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });

  // update user.
  group('updateUserDetails', () {
    test(
      'should return [void] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.updateUserDetails(
            userToken: any(named: 'userToken'),
            userID: any(named: 'userID'),
            accountStatus: any(named: 'accountStatus'),
          ),
        ).thenAnswer(
          (_) async => Future.value(),
        );

        final result = await repoImpl.updateUserDetails(
          userToken: tUserToken,
          userID: tUserID,
          accountStatus: tAccountStatus,
        );

        expect(
          result,
          equals(
            const Right<dynamic, void>(null),
          ),
        );

        verify(
          () => remoteDataSource.updateUserDetails(
            userToken: tUserToken,
            userID: tUserID,
            accountStatus: tAccountStatus,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return [ServerFailure] when call to remote source is '
      'failed',
      () async {
        when(
          () => remoteDataSource.updateUserDetails(
            userToken: any(named: 'userToken'),
            userID: any(named: 'userID'),
            accountStatus: any(named: 'accountStatus'),
          ),
        ).thenThrow(
          tUpdateUserDetailsException,
        );

        final result = await repoImpl.updateUserDetails(
          userToken: tUserToken,
          userID: tUserID,
          accountStatus: tAccountStatus,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tUpdateUserDetailsException.message,
                statusCode: tUpdateUserDetailsException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.updateUserDetails(
            userToken: tUserToken,
            userID: tUserID,
            accountStatus: tAccountStatus,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
