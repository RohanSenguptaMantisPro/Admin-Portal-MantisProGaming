import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class NotificationTextEditField extends StatefulWidget {
  const NotificationTextEditField({
    required this.fieldTitle,
    required this.controller,
    required this.onChanged,
    required this.wordCount,
    required this.wordLimit,
    super.key,
    this.hintText,
    this.readOnly = false,
    this.fieldHeight,
    this.maxLines,
  });

  final String fieldTitle;
  final TextEditingController controller;
  final String? hintText;
  final bool readOnly;
  final void Function(String text)? onChanged;
  final int wordCount;
  final int wordLimit;
  final double? fieldHeight;
  final int? maxLines;

  @override
  State<NotificationTextEditField> createState() =>
      _NotificationTextEditFieldState();
}

class _NotificationTextEditFieldState extends State<NotificationTextEditField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldTitle,
          style: context.theme.textTheme.bodySmall,
        ),
        SizedBox(
          height: widget.fieldHeight,
          child: IField(
            controller: widget.controller,
            hintText: widget.hintText,
            readOnly: widget.readOnly,
            onChanged: widget.onChanged,
            maxLines: widget.maxLines,
          ),
        ),
        Text(
          '${widget.wordCount} of ${widget.wordLimit} used',
          style: context.theme.textTheme.labelSmall,
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

// const Text(
//   'Title',
//   style: TextStyle(color: Colors.white70),
// ),
// const SizedBox(height: 8),
// TextField(
//   decoration: InputDecoration(
//     filled: true,
//     fillColor: Colors.grey[800],
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide.none,
//     ),
//     hintText: 'Exclusive Announcement - VIP',
//     hintStyle: TextStyle(color: Colors.white54),
//   ),
//   style: const TextStyle(color: Colors.white),
//   onChanged: (text) =>
//       _updateWordCount(text, true),
// ),
// const SizedBox(height: 4),
// Text(
//   '$_titleWordCount of 50 words used',
//   style: TextStyle(
//       color: Colors.white54, fontSize: 12),
// ),
// const SizedBox(height: 16),
// const Text(
//   'Body Text',
//   style: TextStyle(color: Colors.white70),
// ),
// const SizedBox(height: 8),
// TextField(
//   decoration: InputDecoration(
//     filled: true,
//     fillColor: Colors.grey[800],
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide.none,
//     ),
//     hintText: 'Secret 80% Off Discount Code',
//     hintStyle: TextStyle(color: Colors.white54),
//   ),
//   style: const TextStyle(color: Colors.white),
//   onChanged: (text) =>
//       _updateWordCount(text, false),
// ),
// const SizedBox(height: 4),
// Text(
//   '$_bodyWordCount of 200 words used',
//   style: TextStyle(
//       color: Colors.white54, fontSize: 12),
// ),
