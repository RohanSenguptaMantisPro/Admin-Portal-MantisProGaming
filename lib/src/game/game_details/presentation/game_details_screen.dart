import 'package:flutter/material.dart';

class GameDetailsScreen extends StatelessWidget {
  const GameDetailsScreen({required this.gameID, super.key});

  static const routeName = 'game-details';
  static const pageName = 'Game Details';

  final String gameID;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        gameID,
      ),
    );
  }
}
