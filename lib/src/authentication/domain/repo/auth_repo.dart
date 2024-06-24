import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';

import 'package:flutter/material.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<String> googleSignInService();

  ResultFuture<String> createUser(DataMap jsonPayload);

  ResultFuture<bool> isAdmin(String userToken);

  ResultFuture<void> cacheUserToken(String userToken);

  ResultFuture<String> isUserLoggedIn();

  ResultFuture<AdminDetails> fetchUserData(String userToken);
}
