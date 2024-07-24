import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/widgets/notification_text_edit_field.dart';
import 'package:flutter/material.dart';

class NotificationTextEdit extends StatelessWidget {
  const NotificationTextEdit({
    required this.titleController,
    required this.bodyController,
    required this.updateWordCount,
    required this.titleWordCount,
    required this.bodyWordCount,
    required this.titleWordLimit,
    required this.bodyWordLimit,
    super.key,
  });

  final TextEditingController titleController;
  final TextEditingController bodyController;
  final void Function(String, {required bool isTitle}) updateWordCount;
  final int titleWordCount;
  final int bodyWordCount;
  final int titleWordLimit;

  final int bodyWordLimit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NotificationTextEditField(
          fieldTitle: 'Title',
          controller: titleController,
          hintText: 'Title of the notification',
          onChanged: (String text) => updateWordCount(text, isTitle: true),
          wordCount: titleWordCount,
          wordLimit: titleWordLimit,
          fieldHeight: 33,
        ),
        NotificationTextEditField(
          fieldTitle: 'Body Text',
          controller: bodyController,
          hintText: 'Body of the notification',
          onChanged: (String text) => updateWordCount(text, isTitle: false),
          wordCount: bodyWordCount,
          wordLimit: bodyWordLimit,
          maxLines: 8,
        ),
      ],
    );
  }
}
