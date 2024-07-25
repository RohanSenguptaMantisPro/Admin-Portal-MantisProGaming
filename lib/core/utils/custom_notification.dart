import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

enum NotificationType { success, error }

class CustomNotification extends StatelessWidget {
  const CustomNotification({
    required this.message,
    required this.type,
    super.key,
  });

  final String message;
  final NotificationType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: type == NotificationType.success
            ? Colours.primaryColour
            : Colours.redColour,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            type == NotificationType.success ? Icons.check_circle : Icons.error,
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              message,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          const InkWell(
            onTap: NotificationOverlay.dismiss,
            child: Icon(
              size: 18,
              Icons.close,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context,
    String message,
    NotificationType type,
  ) {
    dismiss(); // Dismiss any existing notification

    _overlayEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.bottomRight,
        child: Material(
          color: Colors.transparent,
          child: CustomNotification(message: message, type: type),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Auto-dismiss after 8 seconds
    Future.delayed(const Duration(seconds: 8), dismiss);
  }

  static void dismiss() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

// Usage example:
void showSuccessNotification(BuildContext context, String message) {
  NotificationOverlay.show(context, message, NotificationType.success);
}

void showErrorNotification(BuildContext context, String message) {
  NotificationOverlay.show(context, message, NotificationType.error);
}
