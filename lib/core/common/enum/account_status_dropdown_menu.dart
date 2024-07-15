enum AccountStatusDropDownMenu {
  unrestricted,
  restricted,
}

extension AccountStatusExtension on AccountStatusDropDownMenu {
  String get value {
    switch (this) {
      case AccountStatusDropDownMenu.unrestricted:
        return 'unrestricted';
      case AccountStatusDropDownMenu.restricted:
        return 'restricted';
    }
  }
}
