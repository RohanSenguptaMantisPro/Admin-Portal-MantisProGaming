import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class PaginationBar extends StatelessWidget {
  const PaginationBar({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    super.key,
  });

  final int currentPage;
  final int totalPages;
  final void Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (builderContext, boxConstraints) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colours.greyBackground,
            ),
            height: 45,
            width: boxConstraints.maxWidth * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Showing ${(currentPage - 1) * 10 + 1} - ${currentPage * 10}'
                  ' of $totalPages Results',
                  style: context.theme.textTheme.bodyMedium
                      ?.copyWith(color: Colours.greyTextColour),
                ),
                if (currentPage > 1)
                  _buildPageButton(
                      '< Previous', () => onPageChanged(currentPage - 1)),
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
                          '$pageNumber', () => onPageChanged(pageNumber));
                    } else if (pageNumber == currentPage - 2 ||
                        pageNumber == currentPage + 2) {
                      return _buildPageButton('...', null);
                    }
                    return SizedBox.shrink();
                  },
                ),
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

  Widget _buildPageButton(String text, void Function()? onPressed) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight:
              text == '$currentPage' ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
