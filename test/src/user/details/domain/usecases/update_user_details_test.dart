import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/repository/user_details_repo.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/usecases/update_user_details.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDetailsRepo extends Mock implements UserDetailsRepo {}

void main() {
  late UserDetailsRepo userDetailsRepo;
  late UpdateUserDetails updateUserDetails;

  setUp(() {
    userDetailsRepo = MockUserDetailsRepo();
    updateUserDetails = UpdateUserDetails(userDetailsRepo);
  });

  const tUserToken = '';
  const tUserID = '';
  const tAccountStatus = '';

  test(
    'should call the [UserDetailsRepo.updateUserDetails]',
    () async {
      when(
        () => userDetailsRepo.updateUserDetails(
          userToken: any(named: 'userToken'),
          userID: any(named: 'userID'),
          accountStatus: any(named: 'accountStatus'),
        ),
      ).thenAnswer(
        (_) async => const Right(null),
      );

      final result = await updateUserDetails(
        const UpdateUserDetailsParams(
          userToken: tUserToken,
          userID: tUserID,
          accountStatus: tAccountStatus,
        ),
      );

      expect(
        result,
        equals(
          const Right<dynamic, void>(null),
        ),
      );

      verify(
        () => userDetailsRepo.updateUserDetails(
          userToken: tUserToken,
          userID: tUserID,
          accountStatus: tAccountStatus,
        ),
      ).called(1);

      verifyNoMoreInteractions(userDetailsRepo);
    },
  );
}
