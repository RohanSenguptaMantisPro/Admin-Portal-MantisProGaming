import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Feedback Screen',
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
