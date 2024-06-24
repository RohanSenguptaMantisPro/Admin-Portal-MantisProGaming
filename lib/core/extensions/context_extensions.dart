import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => mediaQuery.size;

  double get width => screenSize.width;

  double get height => screenSize.height;

  UserTokenProvider get userTokenProvider => read<UserTokenProvider>();
}
