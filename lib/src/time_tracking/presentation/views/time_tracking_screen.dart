import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class TimeTrackingScreen extends StatelessWidget {
  const TimeTrackingScreen({super.key});

  static const routeName = '/time-tracking';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Time Tracking Screen',
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
