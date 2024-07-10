import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/repository/user_details_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'update_user_details.mapper.dart';

class UpdateUserDetails
    extends UsecaseWithParams<void, UpdateUserDetailsParams> {
  const UpdateUserDetails(this._repo);

  final UserDetailsRepo _repo;

  @override
  ResultFuture<void> call(UpdateUserDetailsParams params) =>
      _repo.updateUserDetails(
        userToken: params.userToken,
        userID: params.userID,
        accountStatus: params.accountStatus,
      );
}

@MappableClass(discriminatorKey: 'type')
class UpdateUserDetailsParams with UpdateUserDetailsParamsMappable {
  const UpdateUserDetailsParams({
    required this.userToken,
    required this.userID,
    required this.accountStatus,
  });

  const UpdateUserDetailsParams.empty()
      : this(
          userToken: '',
          userID: '',
          accountStatus: '',
        );

  final String userToken;
  final String userID;
  final String accountStatus;
}
