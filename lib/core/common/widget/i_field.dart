import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class IField extends StatelessWidget {
  const IField({
    required this.controller,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.overrideValidator = false,
    this.prefixIcon,
    this.onSubmitted,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;

  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;

  final Icon? prefixIcon;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      cursorColor: Colours.white,
      cursorHeight: 15,
      style: context.theme.textTheme.bodySmall,
      controller: controller,
      validator: overrideValidator
          ? validator
          : (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return validator?.call(value);
            },
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      keyboardType: keyboardType,
      obscureText: obscureText,
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        // prefixIconConstraints: BoxConstraints(
        //   maxWidth: 10,
        // ),

        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colours.grey,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colours.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colours.grey,
          ),
        ),
        // overwriting the default padding helps with that puffy look
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 0,
        ),
        filled: true,
        fillColor: Colours.backgroundColorDark,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: context.theme.textTheme.bodySmall!.copyWith(
          color: Colours.greyTextColour,
        ),
      ),
    );
  }
}
