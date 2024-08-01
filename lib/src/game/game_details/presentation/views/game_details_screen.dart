import 'package:flutter/material.dart';

class GameDetailsScreen extends StatefulWidget {
  const GameDetailsScreen({required this.gameID, super.key});

  static const routeName = 'game-details';
  static const pageName = 'Game Details';

  final String gameID;

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.gameID,
      ),
    );
  }
}
