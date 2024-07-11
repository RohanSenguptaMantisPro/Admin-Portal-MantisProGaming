import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/usecases/get_user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/usecases/update_user_details.dart';
import 'package:bloc/bloc.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'user_details_event.dart';

part 'user_details_state.dart';

part 'user_details_bloc.mapper.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc({
    required GetUserDetails getUserDetails,
    required UpdateUserDetails updateUserDetails,
  })  : _getUserDetails = getUserDetails,
        _updateUserDetails = updateUserDetails,
        super(const UserDetailsInitial()) {
    on<GetUserDetailsEvent>(_getUserDetailsEventHandler);
    on<UpdateUserDetailsEvent>(_updateUserDetailsEventHandler);
  }

  final GetUserDetails _getUserDetails;
  final UpdateUserDetails _updateUserDetails;

  Future<void> _getUserDetailsEventHandler(
    GetUserDetailsEvent event,
    Emitter<UserDetailsState> emit,
  ) async {
    emit(const GettingUserDetails());

    final result = await _getUserDetails(
      GetUserDetailsParams(
        userToken: event.userToken,
        userID: event.userID,
      ),
    );

    result.fold(
      (failure) => emit(GetUserDetailsError(message: failure.message)),
      (userDetails) => emit(
        GotUserDetails(
          userDetails: userDetails,
        ),
      ),
    );
  }

  Future<void> _updateUserDetailsEventHandler(
    UpdateUserDetailsEvent event,
    Emitter<UserDetailsState> emit,
  ) async {
    emit(const UpdatingUserDetails());

    final result = await _updateUserDetails(
      UpdateUserDetailsParams(
        userToken: event.userToken,
        userID: event.userID,
        accountStatus: event.accountStatus,
      ),
    );

    result.fold(
      (failure) => emit(UpdateUserDetailsError(message: failure.message)),
      (_) => emit(
        const UpdatedUserDetails(),
      ),
    );
  }
}
