import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class SearchUserForm extends StatefulWidget {
  const SearchUserForm({
    required this.textEditingController,
    required this.formKey,
    super.key,
  });

  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;

  @override
  State<SearchUserForm> createState() => _SearchUserFormState();
}

class _SearchUserFormState extends State<SearchUserForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 33,
      child: Form(
        key: widget.formKey,
        child: IField(
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
