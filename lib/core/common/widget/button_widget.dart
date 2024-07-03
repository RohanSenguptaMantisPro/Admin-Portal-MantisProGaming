import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.onTap,
    this.child,
    this.height,
    this.width,
    this.borderColor,
    this.buttonBackgroundColor,
    super.key,
  });

  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? buttonBackgroundColor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.purple,
      //   ),
      // ),
      height: height,
      width: width,
      child: Material(
        color: buttonBackgroundColor ?? Colours.greyBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: child,
        ),
      ),
    );
  }
}
