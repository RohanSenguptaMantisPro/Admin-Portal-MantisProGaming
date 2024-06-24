import 'package:flutter/cupertino.dart';

class UserTokenProvider extends ChangeNotifier {
  String? _userToken;

  String? get userToken => _userToken;

  // when app starts we save.
  void initUser(String userToken) {
    if (_userToken != userToken) _userToken = userToken;
  }

  set userToken(String? userToken) {
    if (_userToken != userToken) {
      _userToken = userToken;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
