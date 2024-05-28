import 'package:admin_portal_mantis_pro_gaming/core/utils/typedefs.dart';

import 'package:flutter/material.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<void> logInWithGoogle();

  ResultFuture<bool> isUserLoggedIn();
}
