import 'package:flutter/material.dart';

class BreadcrumbNotifier extends ChangeNotifier {
  final List<BreadcrumbItem> _items = [];

  List<BreadcrumbItem> get items => List.unmodifiable(_items);

  void updateBreadcrumbs(String location) {
    debugPrint('---path location : $location');
    _items.clear();
    final pathSegments =
        location.split('/').where((segment) => segment.isNotEmpty).toList();
    final StringBuffer currentPath = StringBuffer();
    for (final segment in pathSegments) {
      currentPath.write('/$segment');
      _items.add(
        BreadcrumbItem(
          title: _getReadableTitle(segment),
          path: currentPath.toString(),
        ),
      );
    }

    Future.delayed(Duration.zero, notifyListeners);
    //   duration.zero : else notifyListeners notification is sent
    //   before widget is built
    //   causing errors.
  }

  String _getReadableTitle(String segment) {
    // You may want to customize this method to provide more readable titles
    return segment.replaceAll('-', ' ').capitalize();
  }
}

class BreadcrumbItem {
  BreadcrumbItem({required this.title, required this.path});

  final String title;
  final String path;
}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
