import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/bread_crumb_notifier.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// to show the path of current route.
// and click to go to desired route.
class Breadcrumb extends StatelessWidget {
  const Breadcrumb({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BreadcrumbNotifier>(
      builder: (context, breadcrumbNotifier, child) {
        return Wrap(
          children: breadcrumbNotifier.items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == breadcrumbNotifier.items.length - 1;
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: isLast
                      ? null
                      : () =>
                          _handleNavigation(context, index, breadcrumbNotifier),
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: isLast
                          ? Colours.primaryColour
                          : Colours.greyTextColour,
                    ),
                  ),
                ),
                if (!isLast) const Text(' > '),
              ],
            );
          }).toList(),
        );
      },
    );
  }

  void _handleNavigation(
    BuildContext context,
    int targetIndex,
    BreadcrumbNotifier breadcrumbNotifier,
  ) {
    final currentIndex = breadcrumbNotifier.items.length - 1;
    final popCount = currentIndex - targetIndex;

    // to pop pages as many times needed, based on which path user has selected
    // to go back to.
    if (popCount > 0) {
      for (int i = 0; i < popCount; i++) {
        GoRouter.of(context).routerDelegate.popRoute();
      }
    } else {
      // If we can't pop (e.g., when the target is not in the current stack),
      // fall back to using go()
      context.go(breadcrumbNotifier.items[targetIndex].path);
    }
  }
}
