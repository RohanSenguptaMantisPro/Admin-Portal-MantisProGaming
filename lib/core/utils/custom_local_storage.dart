import 'package:shared_preferences/shared_preferences.dart';

class CustomLocalStorage {
  CustomLocalStorage({required this.prefs});

  final SharedPreferences prefs;

  Future<bool> setString(String key, String value) async {
    return prefs.setString(key, value);
  }

  String? getString(String key) {
    return prefs.getString(key);
  }

  Future<bool> clear() async {
    return prefs.clear();
  }
}
