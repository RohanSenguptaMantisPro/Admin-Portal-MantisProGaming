import 'package:admin_portal_mantis_pro_gaming/userSearch/presentation/views/user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {
  final List<Widget> _screens = [
    UserSearchScreen(),
  ];

  List<Widget> get screens => _screens;
  int _currentIndex = 0; // default page to land users on.

  int get currentIndex => _currentIndex; //

  void changeIndex(int index) {
    if (_currentIndex == index) return;
    _currentIndex = index;
    notifyListeners();
  }

  void resetIndex() {
    _currentIndex = 0;
    notifyListeners();
  }
}
