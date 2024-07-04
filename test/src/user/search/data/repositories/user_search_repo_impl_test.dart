import 'package:admin_portal_mantis_pro_gaming/core/errors/exceptions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/datasources/user_search_remote_data_sources.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/models/user_search_response_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/data/repositories/user_search_repo_impl.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSearchRemoteDataSources extends Mock
    implements UserSearchRemoteDataSources {}

void main() {
  late MockUserSearchRemoteDataSources remoteDataSource;
  late UserSearchRepoImpl repoImpl;

  setUp(() {
    remoteDataSource = MockUserSearchRemoteDataSources();
    repoImpl = UserSearchRepoImpl(remoteDataSource);
  });

  const tUserSearchResponseModel = UserSearchResponseModel.empty();

  const tUserDataFetchException = ServerException(
    message: 'could not fetch user data',
    statusCode: '404',
  );

  const tUserToken = 'test user token';
  const tPageNumber = 1;
  const tPageLimit = 10;
  const tField = 'name';
  const tQuery = 'query';
  const tCountry = 'country';
  const tAccountStatus = 'accountStatus';

  group('userSearchResults', () {
    test(
      'should return [UserSearchResponse] when call to remote source is '
      'successful',
      () async {
        when(
          () => remoteDataSource.userSearchResults(
            userToken: any(named: 'userToken'),
            pageNumber: any(named: 'pageNumber'),
            limit: any(named: 'limit'),
            field: any(named: 'field'),
            query: any(named: 'query'),
            country: any(named: 'country'),
            accountStatus: any(named: 'accountStatus'),
          ),
        ).thenAnswer(
          (_) async => tUserSearchResponseModel,
        );

        final result = await repoImpl.userSearchResults(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        );

        expect(
          result,
          equals(
            const Right<dynamic, UserSearchResponse>(
              tUserSearchResponseModel,
            ),
          ),
        );

        verify(
          () => remoteDataSource.userSearchResults(
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
            country: tCountry,
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
          () => remoteDataSource.userSearchResults(
            userToken: any(named: 'userToken'),
            pageNumber: any(named: 'pageNumber'),
            limit: any(named: 'limit'),
            field: any(named: 'field'),
            query: any(named: 'query'),
            country: any(named: 'country'),
            accountStatus: any(named: 'accountStatus'),
          ),
        ).thenThrow(
          tUserDataFetchException,
        );

        final result = await repoImpl.userSearchResults(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        );

        expect(
          result,
          equals(
            Left<dynamic, void>(
              ServerFailure(
                message: tUserDataFetchException.message,
                statusCode: tUserDataFetchException.statusCode,
              ),
            ),
          ),
        );

        verify(
          () => remoteDataSource.userSearchResults(
            userToken: tUserToken,
            pageNumber: tPageNumber,
            limit: tPageLimit,
            field: tField,
            query: tQuery,
            country: tCountry,
            accountStatus: tAccountStatus,
          ),
        ).called(1);

        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
