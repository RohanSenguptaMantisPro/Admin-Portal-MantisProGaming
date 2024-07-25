import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class NotificationTextEditField extends StatefulWidget {
  const NotificationTextEditField({
    required this.fieldTitle,
    required this.controller,
    required this.onChanged,
    required this.letterCount,
    required this.letterLimit,
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
  final int letterCount;
  final int letterLimit;
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
          '${widget.letterCount} of ${widget.letterLimit} used',
          style: context.theme.textTheme.labelSmall!.copyWith(
            color: widget.letterCount > widget.letterLimit
                ? Colours.redColour
                : null,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
