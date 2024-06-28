import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    this.onTap,
    this.child,
    this.height,
    this.width,
    this.borderColor,
    super.key,
  });

  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final Color? borderColor;

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
        color: Colours.greyBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: borderColor ?? Colours.grey),
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
