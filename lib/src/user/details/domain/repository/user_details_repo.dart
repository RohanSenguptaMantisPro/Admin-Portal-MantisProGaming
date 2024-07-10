import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/domain/entities/user_details.dart';

abstract class UserDetailsRepo {
  const UserDetailsRepo();

  ResultFuture<UserDetails> getUserDetails({
    required String userToken,
    required String userID,
  });

  ResultFuture<void> updateUserDetails({
    required String userToken,
    required String userID,
    required String accountStatus,
  });
}
