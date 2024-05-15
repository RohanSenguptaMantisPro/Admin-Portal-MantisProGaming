import 'package:admin_portal_mantis_pro_gaming/feedback/presentation/views/feedback_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/global_dashboard/presentation/views/global_dashboard_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/incentives/presentation/views/incentives_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/time_tracking/presentation/views/time_tracking_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/user_search/presentation/views/user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardController extends ChangeNotifier {
  final List<Widget> _screens = [
    const GlobalDashboardScreen(),
    const UserSearchScreen(),
    const TimeTrackingScreen(),
    const IncentivesScreen(),
    const FeedbackScreen(),
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
