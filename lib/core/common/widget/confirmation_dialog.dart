import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog {
  static Future<bool> show({
    required BuildContext context,
    String title = 'Confirmation',
    String content = 'Are you sure you want to proceed?',
    String? cancelText,
    String confirmText = 'Confirm',
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colours.backgroundColourLightDark,
              title: Text(
                title,
                style: context.theme.textTheme.titleSmall,
              ),
              content: Text(
                content,
                style: context.theme.textTheme.bodyMedium,
              ),
              actions: <Widget>[
                if (cancelText != null)
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colours.primaryColour,
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: const TextStyle(color: Colours.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colours.primaryColour,
                    ),
                  ),
                  child: Text(
                    confirmText,
                    style: const TextStyle(color: Colours.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }
}
