import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:flutter/material.dart';

class DashboardContainer extends StatelessWidget {
  const DashboardContainer({
    required this.iconAsset,
    required this.title,
    required this.isCurrentPageActive,
    required this.currentPageIndex,
    required this.changeIndexFunction,
    super.key,
  });

  final String iconAsset;
  final String title;
  final bool isCurrentPageActive;
  final int currentPageIndex;
  final void Function(int index) changeIndexFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      mouseCursor: SystemMouseCursors.click,
      onTap: () => changeIndexFunction(currentPageIndex),
      child: Container(
        padding: const EdgeInsets.only(
          left: 8,
          top: 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isCurrentPageActive
              ? Colours.primaryColourLight
              : Colours.backgroundColorDark,
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: isCurrentPageActive
                      ? const ColorFilter.mode(Colors.green, BlendMode.srcIn)
                      : null,
                  image: AssetImage(
                    iconAsset,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Icon(
            //   // TODO(RohanSengupta): to be
            //   //  changed with custom icon later.
            //   icon,
            //   color: isCurrentPageActive
            //       ? Colours.primaryColour
            //       : Colours.dashBoardIconColour,
            //   size: 20,
            // ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: context.theme.textTheme.bodySmall!.copyWith(
                color: isCurrentPageActive
                    ? Colours.primaryColour
                    : Colours.lightWhiteTextColour,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
