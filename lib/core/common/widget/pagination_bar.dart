import 'dart:math' as math;

import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class PaginationBar extends StatelessWidget {
  const PaginationBar({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    required this.totalResults,
    super.key,
  });

  final int currentPage;
  final int totalPages;
  final int totalResults;
  final void Function(int) onPageChanged;

  Widget _buildPageButton(String text, void Function()? onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size(35, 35),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: (text == '$currentPage' ||
                    text == '< Previous' ||
                    text == 'Next >')
                ? Colours.white
                : Colours.greyTextColour,
            fontSize: 14,
            fontWeight:
                text == '$currentPage' ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildPageButtons() {
    const int maxVisiblePages = 5;
    List<Widget> buttons = [];

    void addButton(int pageNum) {
      buttons.add(_buildPageButton('$pageNum', () => onPageChanged(pageNum)));
    }

    void addEllipsis() {
      buttons.add(_buildPageButton('...', null));
    }

    addButton(1);

    if (totalPages <= maxVisiblePages) {
      for (int i = 2; i < totalPages; i++) {
        addButton(i);
      }
    } else {
      if (currentPage > 3) addEllipsis();

      for (int i = math.max(2, currentPage - 1);
          i <= math.min(currentPage + 1, totalPages - 1);
          i++) {
        addButton(i);
      }

      if (currentPage < totalPages - 2) addEllipsis();
    }

    if (totalPages > 1) addButton(totalPages);

    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builderContext, boxConstraints) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colours.greyBackground,
              border: Border.all(
                color: Colours.white.withOpacity(0.2),
              ),
            ),
            height: 45,
            width: boxConstraints.maxWidth * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Showing ${(currentPage - 1) * 10 + 1} - '
                  '${math.min(currentPage * 10, totalResults)} of $totalResults Results',
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: Colours.greyTextColour),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(width: 25),
                if (currentPage > 1)
                  _buildPageButton(
                      '< Previous', () => onPageChanged(currentPage - 1)),
                const SizedBox(width: 16),
                ..._buildPageButtons(),
                const SizedBox(width: 16),
                if (currentPage < totalPages)
                  _buildPageButton(
                      'Next >', () => onPageChanged(currentPage + 1)),
              ],
            ),
          ),
        );
      },
    );
  }
}
