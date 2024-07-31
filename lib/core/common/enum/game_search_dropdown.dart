enum GameSearchByDropDownMenu {
  name,
  packageName,
  none,
}

extension GameSearchByDropDownMenuExtension on GameSearchByDropDownMenu {
  String get value {
    switch (this) {
      case GameSearchByDropDownMenu.name:
        return 'name';
      case GameSearchByDropDownMenu.packageName:
        return 'package name';
      case GameSearchByDropDownMenu.none:
        return '--none--';
    }
  }
}