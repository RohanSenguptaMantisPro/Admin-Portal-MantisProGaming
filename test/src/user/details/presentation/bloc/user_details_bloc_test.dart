import 'package:admin_portal_mantis_pro_gaming/core/errors/failures.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/usecases/get_user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/usecases/update_user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/presentation/bloc/user_details_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUserDetails extends Mock implements GetUserDetails {}

class MockUpdateUserDetails extends Mock implements UpdateUserDetails {}

void main() {
  late GetUserDetails getUserDetails;
  late UpdateUserDetails updateUserDetails;

  late UserDetailsBloc userDetailsBloc;

  const tUserToken = '';
  const tUserID = '';
  const tAccountStatus = '';

  const tUserDetails = UserDetails.empty();

  const tGetUserDetailsParams = GetUserDetailsParams.empty();
  const tUpdateUserDetailsParams = UpdateUserDetailsParams.empty();

  final tServerFailure = ServerFailure(
    message: 'could not fetch user details',
    statusCode: '404',
  );

  setUp(() {
    getUserDetails = MockGetUserDetails();
    updateUserDetails = MockUpdateUserDetails();

    userDetailsBloc = UserDetailsBloc(
      getUserDetails: getUserDetails,
      updateUserDetails: updateUserDetails,
    );
  });

  setUpAll(() {
    registerFallbackValue(tGetUserDetailsParams);
    registerFallbackValue(tUpdateUserDetailsParams);
  });

  tearDown(() => userDetailsBloc.close());

  test('initialState should be [UserDetailsInitial]', () {
    expect(userDetailsBloc.state, const UserDetailsInitial());
  });

  group('GetUserDetails', () {
    blocTest<UserDetailsBloc, UserDetailsState>(
      'should emit [GettingUserDetails, FetchedUserDetails]'
      ' when [GetUserDetailsEvent] '
      'is added and succeeds',
      build: () {
        when(() => getUserDetails(any())).thenAnswer(
          (_) async => const Right(tUserDetails),
        );
        return userDetailsBloc;
      },
      act: (bloc) => bloc.add(
        GetUserDetailsEvent(
          userToken: tUserToken,
          userID: tUserID,
        ),
      ),
      expect: () => [
        const GettingUserDetails(),
        const GotUserDetails(userDetails: tUserDetails),
      ],
      verify: (_) {
        verify(
          () => getUserDetails(
            tGetUserDetailsParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(getUserDetails);
      },
    );

    blocTest<UserDetailsBloc, UserDetailsState>(
      'should emit [GettingUserDetails, GetUserDetailsError] when '
      'GetUserDetailsEvent is added '
      'and fails',
      build: () {
        when(() => getUserDetails(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return userDetailsBloc;
      },
      act: (bloc) => bloc.add(
        GetUserDetailsEvent(
          userToken: tUserToken,
          userID: tUserID,
        ),
      ),
      expect: () => [
        const GettingUserDetails(),
        GetUserDetailsError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(
          () => getUserDetails(
            tGetUserDetailsParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(getUserDetails);
      },
    );
  });

  //update user details.
  group('UpdateUserDetails', () {
    blocTest<UserDetailsBloc, UserDetailsState>(
      'should emit [UpdatingUserDetails, UpdatedUserDetails]'
      ' when [UpdateUserDetailsEvent] '
      'is added and succeeds',
      build: () {
        when(() => updateUserDetails(any())).thenAnswer(
          (_) async => const Right(null),
        );
        return userDetailsBloc;
      },
      act: (bloc) => bloc.add(
        UpdateUserDetailsEvent(
          userToken: tUserToken,
          userID: tUserID,
          accountStatus: tAccountStatus,
        ),
      ),
      expect: () => [
        const UpdatingUserDetails(),
        const UpdatedUserDetails(),
      ],
      verify: (_) {
        verify(
          () => updateUserDetails(
            tUpdateUserDetailsParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(updateUserDetails);
      },
    );

    blocTest<UserDetailsBloc, UserDetailsState>(
      'should emit [UpdatingUserDetails, UpdateUserDetailsError] when '
      '[UpdateUserDetailsEvent] is added '
      'and fails',
      build: () {
        when(() => updateUserDetails(any())).thenAnswer(
          (_) async => Left(tServerFailure),
        );
        return userDetailsBloc;
      },
      act: (bloc) => bloc.add(
        UpdateUserDetailsEvent(
          userToken: tUserToken,
          userID: tUserID,
          accountStatus: tAccountStatus,
        ),
      ),
      expect: () => [
        const UpdatingUserDetails(),
        UpdateUserDetailsError(message: tServerFailure.errorMessage),
      ],
      verify: (_) {
        verify(
          () => updateUserDetails(
            tUpdateUserDetailsParams,
          ),
        ).called(1);
        verifyNoMoreInteractions(updateUserDetails);
      },
    );
  });
}
