import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class PushNotificationsScreen extends StatelessWidget {
  const PushNotificationsScreen({super.key});

  static const routeName = '/push-notifications';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Push Notifications',
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
