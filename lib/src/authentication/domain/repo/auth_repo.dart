import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';

import 'package:flutter/material.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<String> createUser();

  ResultFuture<bool> isAdmin(String userToken);

  ResultFuture<void> cacheUserToken(String userToken);

  ResultFuture<bool> isUserLoggedIn();
}
