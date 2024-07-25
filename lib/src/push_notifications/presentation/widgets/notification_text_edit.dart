import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/widgets/notification_text_edit_field.dart';
import 'package:flutter/material.dart';

class NotificationTextEdit extends StatelessWidget {
  const NotificationTextEdit({
    required this.titleController,
    required this.bodyController,
    required this.updateLetterCount,
    required this.titleLetterCount,
    required this.bodyLetterCount,
    required this.titleLetterLimit,
    required this.bodyLetterLimit,
    super.key,
  });

  final TextEditingController titleController;
  final TextEditingController bodyController;
  final void Function(String, {required bool isTitle}) updateLetterCount;
  final int titleLetterCount;
  final int bodyLetterCount;
  final int titleLetterLimit;

  final int bodyLetterLimit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NotificationTextEditField(
          fieldTitle: 'Title',
          controller: titleController,
          hintText: 'Title of the notification',
          onChanged: (String text) => updateLetterCount(text, isTitle: true),
          letterCount: titleLetterCount,
          letterLimit: titleLetterLimit,
          fieldHeight: 33,
        ),
        NotificationTextEditField(
          fieldTitle: 'Body Text',
          controller: bodyController,
          hintText: 'Body of the notification',
          onChanged: (String text) => updateLetterCount(text, isTitle: false),
          letterCount: bodyLetterCount,
          letterLimit: bodyLetterLimit,
          maxLines: 8,
        ),
      ],
    );
  }
}
