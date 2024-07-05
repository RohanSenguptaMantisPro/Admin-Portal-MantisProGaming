import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_search_response.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/repositories/user_search_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserSearchRepo extends Mock implements UserSearchRepo {}

void main() {
  late UserSearchRepo userSearchRepo;
  late UserSearchResults userSearchResults;

  setUp(() {
    userSearchRepo = MockUserSearchRepo();
    userSearchResults = UserSearchResults(userSearchRepo);
  });

  const tUserToken = 'test user token';
  const tPageNumber = '1';
  const tPageLimit = '10';
  const tField = 'name';
  const tQuery = 'query';
  const tCountry = 'country';
  const tAccountStatus = 'accountStatus';

  const tUserSearchResponse = UserSearchResponse.empty();

  test(
    'should call the [UserSearchRepo.userSearchResults]',
    () async {
      when(
        () => userSearchRepo.userSearchResults(
          userToken: any(named: 'userToken'),
          pageNumber: any(named: 'pageNumber'),
          limit: any(named: 'limit'),
          field: any(named: 'field'),
          query: any(named: 'query'),
          country: any(named: 'country'),
          accountStatus: any(named: 'accountStatus'),
        ),
      ).thenAnswer(
        (_) async => const Right(tUserSearchResponse),
      );

      final result = await userSearchResults(
        const UserSearchResultsParams(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        ),
      );

      expect(
        result,
        equals(
          const Right<dynamic, UserSearchResponse>(tUserSearchResponse),
        ),
      );

      verify(
        () => userSearchRepo.userSearchResults(
          userToken: tUserToken,
          pageNumber: tPageNumber,
          limit: tPageLimit,
          field: tField,
          query: tQuery,
          country: tCountry,
          accountStatus: tAccountStatus,
        ),
      ).called(1);

      verifyNoMoreInteractions(userSearchRepo);
    },
  );
}
