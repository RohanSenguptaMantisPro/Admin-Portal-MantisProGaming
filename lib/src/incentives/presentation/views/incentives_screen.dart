import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class IncentivesScreen extends StatelessWidget {
  const IncentivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Incentives Screen',
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
