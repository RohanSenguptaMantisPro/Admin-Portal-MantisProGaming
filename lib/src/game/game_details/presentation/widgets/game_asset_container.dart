import 'package:flutter/material.dart';

class GameAssetContainer extends StatelessWidget {
  const GameAssetContainer({
    required this.onBrowse,
    required this.onView,
    super.key,
  });

  final VoidCallback onBrowse;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton('Browse Image', onBrowse),
          const SizedBox(height: 16),
          _buildButton('View Image', onView),
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.green,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
