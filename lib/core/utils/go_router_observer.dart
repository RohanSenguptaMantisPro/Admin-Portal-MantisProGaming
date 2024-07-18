import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/bread_crumb_notifier.dart';
import 'package:flutter/material.dart';

// observer to notify when new page is pushed and page is popped.
class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required this.breadcrumbNotifier});

  final BreadcrumbNotifier breadcrumbNotifier;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('---------GoRouter ShellRoute : Pushed new page :'
        ' ${route.settings.name}/${route.settings.arguments}');

    if (route.settings.name != null) {
      breadcrumbNotifier.updateBreadcrumbs(route.settings.name!);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute?.settings.name != null) {
      debugPrint('---------GoRouter : Popped page');
      breadcrumbNotifier.updateBreadcrumbs(previousRoute!.settings.name!);
    }
  }
}
