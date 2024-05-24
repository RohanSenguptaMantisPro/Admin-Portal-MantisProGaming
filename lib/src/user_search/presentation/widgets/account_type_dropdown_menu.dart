import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class AccountTypeDropdownMenu extends StatelessWidget {
  const AccountTypeDropdownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      decoration: ShapeDecoration(
        color: Colours.backgroundColourLightDark,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colours.grey,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Account Type 1',
            style: context.theme.textTheme.bodySmall,
          ),
          const Divider(
            color: Colours.white,
          ),
          Text(
            'Account Type 2',
            style: context.theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
