import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // Remove default padding
        minimumSize: const Size(35, 35), // Set a minimum size
        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduce tap target
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
    );
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
                  'Showing ${(currentPage - 1) * 10 + 1} - ${currentPage * 10}'
                  ' of $totalResults Results',
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: Colours.greyTextColour),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (currentPage > 1)
                  _buildPageButton(
                    '< Previous',
                    () => onPageChanged(currentPage - 1),
                  ),
                ...List.generate(
                  totalPages,
                  (index) {
                    final pageNumber = index + 1;
                    if (pageNumber == currentPage ||
                        pageNumber == 1 ||
                        pageNumber == totalPages ||
                        (pageNumber == currentPage - 1 && currentPage > 2) ||
                        (pageNumber == currentPage + 1 &&
                            currentPage < totalPages - 1)) {
                      return _buildPageButton(
                        '$pageNumber',
                        () => onPageChanged(pageNumber),
                      );
                    } else if (pageNumber == currentPage - 2 ||
                        pageNumber == currentPage + 2) {
                      return _buildPageButton('...', null);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                if (currentPage < totalPages)
                  _buildPageButton(
                    'Next >',
                    () => onPageChanged(currentPage + 1),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
