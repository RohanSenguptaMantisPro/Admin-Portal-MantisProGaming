import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BreadcrumbNavigation extends StatelessWidget {
  const BreadcrumbNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context) ;
    final String location =
        router.routerDelegate.currentConfiguration.uri.toString();
    final List<String> pathSegments = location.split('/')
      ..removeWhere((segment) => segment.isEmpty);

    debugPrint('--------- $location');

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        children: List.generate(pathSegments.length, (index) {
          final segment = pathSegments[index];
          final isLast = index == pathSegments.length - 1;

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: isLast ? null : router.pop,
                child: Text(
                  segment.replaceAll('-', ' ').capitalize(),
                  style: TextStyle(
                    color: isLast ? Colours.primaryColour : Colors.grey,
                  ),
                ),
              ),
              if (!isLast)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child:
                      Icon(Icons.chevron_right, size: 16, color: Colors.grey),
                ),
            ],
          );
        }),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
