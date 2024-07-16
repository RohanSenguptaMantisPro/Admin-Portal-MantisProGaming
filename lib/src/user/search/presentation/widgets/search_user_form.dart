import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class SearchUserForm extends StatefulWidget {
  SearchUserForm({
    required this.textEditingController,
    required this.formKey,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;
  final void Function(String)? onSubmitted;

  @override
  State<SearchUserForm> createState() => _SearchUserFormState();
}

class _SearchUserFormState extends State<SearchUserForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 33,
      child: Form(
        key: widget.formKey,
        child: IField(
          onSubmitted: widget.onSubmitted,
          controller: widget.textEditingController,
          hintText: 'Search by account, name, userID...',
          prefixIcon: const Icon(
            Icons.search,
            color: Colours.lightWhiteIconColor,
          ),
        ),
      ),
    );
  }
}
