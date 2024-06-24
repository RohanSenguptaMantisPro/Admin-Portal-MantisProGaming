import 'package:admin_portal_mantis_pro_gaming/src/dashboard/profile/presentation/views/admin_profile_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/feedback/presentation/views/feedback_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/global_dashboard/presentation/views/global_dashboard_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/incentives/presentation/views/incentives_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/time_tracking/presentation/views/time_tracking_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user_search/presentation/views/user_search_screen.dart';

import 'package:flutter/material.dart';

class DashboardController extends ChangeNotifier {
  // later might need to wrap these screens in changeNotifierProvider
  // for customNavigation state management.
  final List<Widget> _screens = [
    const GlobalDashboardScreen(),
    const UserSearchScreen(),
    const TimeTrackingScreen(),
    const IncentivesScreen(),
    const FeedbackScreen(),
    const AdminProfileScreen(),
  ];

  List<Widget> get screens => _screens;
  int _currentIndex = 1; // default page to land users on.

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
