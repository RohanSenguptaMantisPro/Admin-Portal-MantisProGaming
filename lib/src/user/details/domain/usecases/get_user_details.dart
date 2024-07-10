import 'package:admin_portal_mantis_pro_gaming/core/usecases/usecases.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/repository/user_details_repo.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'get_user_details.mapper.dart';

class GetUserDetails
    extends UsecaseWithParams<UserDetails, GetUserDetailsParams> {
  const GetUserDetails(this._repo);

  final UserDetailsRepo _repo;

  @override
  ResultFuture<UserDetails> call(GetUserDetailsParams params) =>
      _repo.getUserDetails(
        userToken: params.userToken,
        userID: params.userID,
      );
}

@MappableClass(discriminatorKey: 'type')
class GetUserDetailsParams with GetUserDetailsParamsMappable {
  const GetUserDetailsParams({
    required this.userToken,
    required this.userID,
  });

  const GetUserDetailsParams.empty()
      : this(
          userToken: '',
          userID: '',
        );

  final String userToken;
  final String userID;
}
