import 'package:admin_portal_mantis_pro_gaming/src/authentication/data/models/admin_details_model.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:flutter/cupertino.dart';

class AdminUserData extends ChangeNotifier {
  AdminDetails? _userData;

  AdminDetails? get userData => _userData;

  // when app starts we save.
  void initUser(AdminDetails userData) {
    if (_userData != userData) _userData = userData;
  }

  set userData(AdminDetails? userData) {
    if (_userData != userData) {
      _userData = userData;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
