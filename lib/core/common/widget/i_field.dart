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
    this.onChanged,
    this.maxLines,
    this.prefixIconConstraints,
    this.errorText,
    this.focusNode,
    this.prefixIconPadding, // New parameter
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final Widget? prefixIcon;
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final int? maxLines;
  final BoxConstraints? prefixIconConstraints;
  final String? errorText;
  final FocusNode? focusNode;
  final EdgeInsets? prefixIconPadding; // New parameter

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLines: maxLines ?? 1,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      cursorColor: Colours.white,
      cursorHeight: 15,
      style: context.theme.textTheme.bodyMedium,
      controller: controller,
      validator: overrideValidator
          ? validator
          : (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required ';
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
        prefixIconConstraints: prefixIconConstraints,
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: prefixIconPadding ?? EdgeInsets.zero,
          child: prefixIcon,
        )
            : null,
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
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: maxLines != null ? 12 : 0,
        ),
        filled: true,
        fillColor: Colours.backgroundColorDark,
        suffixIcon: suffixIcon,
        hintText: hintText,
        errorText: errorText,
        hintStyle: context.theme.textTheme.bodySmall!.copyWith(
          color: Colours.greyTextColour,
        ),
      ),
    );
  }
}