import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'AdminProfileScreen',
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
