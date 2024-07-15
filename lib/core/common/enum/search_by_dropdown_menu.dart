enum SearchByDropDownMenu {
  name,
  email,
  username,
  none,
}

extension SearchByDropDownMenuExtension on SearchByDropDownMenu {
  String get value {
    switch (this) {
      case SearchByDropDownMenu.name:
        return 'name';
      case SearchByDropDownMenu.email:
        return 'email';
      case SearchByDropDownMenu.username:
        return 'username';
      case SearchByDropDownMenu.none:
        return '--none--';
    }
  }
}
