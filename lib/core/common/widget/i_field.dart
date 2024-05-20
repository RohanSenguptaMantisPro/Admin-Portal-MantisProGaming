import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class IField extends StatelessWidget {
  const IField({
    required this.controller,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    super.key,
    this.validator,
    this.fillColour,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.maxLines,
    this.prefixIcon,
    this.cursorColor,
    this.borderColor,
    this.borderRadius,
    this.contentPadding,
    this.cursorHeight,
    this.inputTextStyle,
  });

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColour;
  final bool obscureText;
  final bool readOnly;

  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final int? maxLines;
  final Icon? prefixIcon;
  final Color? cursorColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;
  final double? cursorHeight;
  final TextStyle? inputTextStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: cursorColor,
      cursorHeight: cursorHeight,
      style: inputTextStyle,
      maxLines: maxLines,
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
          borderSide: BorderSide(
            color: borderColor ?? Colours.grey,
          ),
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(
            color: borderColor ?? Colours.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(
            color: borderColor ?? Colours.grey,
          ),
        ),
        // overwriting the default padding helps with that puffy look
        contentPadding: contentPadding,
        filled: filled,
        fillColor: fillColour,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
      ),
    );
  }
}
