import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/bloc/user_search_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSearchResults extends Mock implements UserSearchResults {}

void main() {
  late UserSearchResults userSearchResults;

  late UserSearchBloc userSearchBloc;

  const tUserToken = '';
  const tPageNumber = '';
  const tPageLimit = '';
  const tField = '';
  const tQuery = '';
  const tCountry = '';
  const tAccountStatus = '';

  const tUserSearchResponse = UserSearchResponse.empty();
  const tUserSearchResultsParams = UserSearchResultsParams.empty();

  final tUserDataFetchFailure = ServerFailure(
    message: 'could not fetch user data',
    statusCode: '404',
  );

  setUp(() {
    userSearchResults = MockUserSearchResults();

    userSearchBloc = UserSearchBloc(
      userSearchResults: userSearchResults,
    );
  });

  setUpAll(() {
    registerFallbackValue(tUserSearchResultsParams);
  });

  tearDown(() => userSearchBloc.close());

  test('initialState should be [AuthInitial]', () {
    expect(userSearchBloc.state, const UserSearchInitial());
  });

  group('FetchUserDataEvent', () {
    blocTest<UserSearchBloc, UserSearchState>(
      'should emit [UserSearchLoading, FetchedUserDetails]'
      ' when SearchByEvent '
      'is added and succeeds',
      build: () {
        when(() => userSearchResults(any())).thenAnswer(
          (_) async => const Right(tUserSearchResponse),
        );
        return userSearchBloc;
      },
      act: (bloc) => bloc.add(
        SearchByEvent(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        ),
      ),
      expect: () => [
        const UserSearchLoading(),
        FetchedUserData(userSearchResponse: tUserSearchResponse),
      ],
      verify: (_) {
        verify(
          () => userSearchResults(
            tUserSearchResultsParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(userSearchResults);
      },
    );

    blocTest<UserSearchBloc, UserSearchState>(
      'should emit [UserSearchResultsLoading, UserSearchResultsError] when '
      'FetchAdminDetailsEvent is added '
      'and fails',
      build: () {
        when(() => userSearchResults(any())).thenAnswer(
          (_) async => Left(tUserDataFetchFailure),
        );
        return userSearchBloc;
      },
      act: (bloc) => bloc.add(
        SearchByEvent(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        ),
      ),
      expect: () => [
        const UserSearchLoading(),
        UserSearchError(message: tUserDataFetchFailure.errorMessage),
      ],
      verify: (_) {
        verify(
          () => userSearchResults(
            tUserSearchResultsParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(userSearchResults);
      },
    );
  });
}
