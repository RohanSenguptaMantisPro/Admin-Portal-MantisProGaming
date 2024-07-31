import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class SearchGameForm extends StatefulWidget {
  SearchGameForm({
    required this.textEditingController,
    required this.formKey,
    this.onSubmitted,
    super.key,
  });

  final TextEditingController textEditingController;
  final GlobalKey<FormState> formKey;
  final void Function(String)? onSubmitted;

  @override
  State<SearchGameForm> createState() => _SearchGameFormState();
}

class _SearchGameFormState extends State<SearchGameForm> {
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
          hintText: 'Search by game name, package name...',
          prefixIcon: const Icon(
            Icons.search,
            color: Colours.lightWhiteIconColor,
          ),
        ),
      ),
    );
  }
}
