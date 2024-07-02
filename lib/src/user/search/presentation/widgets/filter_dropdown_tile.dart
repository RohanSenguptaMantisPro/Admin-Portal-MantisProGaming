import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class FilterDropdown extends StatelessWidget {
  const FilterDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: ShapeDecoration(
        color: Colours.backgroundColourLightDark,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colours.grey,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      child: Text(
        'Filter Options',
        style: context.theme.textTheme.bodySmall,
      ),
    );
  }
}
