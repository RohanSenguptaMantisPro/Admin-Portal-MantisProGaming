import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class GameNameEditForm extends StatefulWidget {
  const GameNameEditForm({
    required this.textEditingController,
    required this.formKey,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;
  final void Function(String)? onSubmitted;

  @override
  State<GameNameEditForm> createState() => _GameNameEditFormState();
}

class _GameNameEditFormState extends State<GameNameEditForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Game Name'),
        SizedBox(
          width: 300,
          height: 33,
          child: Form(
            key: widget.formKey,
            child: IField(
              onSubmitted: widget.onSubmitted,
              controller: widget.textEditingController,
              hintText: 'Game name',
              prefixIcon: const Icon(
                Icons.edit,
                color: Colours.lightWhiteIconColor,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
