import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

ToastFuture showCustomToast(BuildContext toastContext, String toastTitle) {
  final Widget widget = Center(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 500,
        height: 60,
        color: Colours.primaryColour,
        child: Center(
          child: Text(
            toastTitle,
            style: toastContext.theme.textTheme.bodySmall,
          ),
        ),
      ),
    ),
  );

  final toastFuture = showToastWidget(
    widget,
    context: toastContext,
    dismissOtherToast: true,
    duration: const Duration(seconds: 3),
    position: ToastPosition.bottom ,
    textDirection: TextDirection.ltr,
  );
  return toastFuture;
}
