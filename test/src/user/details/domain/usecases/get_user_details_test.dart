import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/repository/user_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/usecases/get_user_details.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDetailsRepo extends Mock implements UserDetailsRepo {}

void main() {
  late UserDetailsRepo userDetailsRepo;
  late GetUserDetails getUserDetails;

  setUp(() {
    userDetailsRepo = MockUserDetailsRepo();
    getUserDetails = GetUserDetails(userDetailsRepo);
  });

  const tUserToken = '';
  const tUserID = '';

  const tUserDetails = UserDetails.empty();

  test(
    'should call the [UserDetailsRepos.getUserDetails]',
    () async {
      when(
        () => userDetailsRepo.getUserDetails(
          userToken: any(named: 'userToken'),
          userID: any(named: 'userID'),
        ),
      ).thenAnswer(
        (_) async => const Right(tUserDetails),
      );

      final result = await getUserDetails(
        const GetUserDetailsParams(
          userToken: tUserToken,
          userID: tUserID,
        ),
      );

      expect(
        result,
        equals(
          const Right<dynamic, UserDetails>(tUserDetails),
        ),
      );

      verify(
        () => userDetailsRepo.getUserDetails(
          userToken: tUserToken,
          userID: tUserID,
        ),
      ).called(1);

      verifyNoMoreInteractions(userDetailsRepo);
    },
  );
}
