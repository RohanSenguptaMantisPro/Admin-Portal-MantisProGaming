import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({required this.uID, super.key});

  static const routeName = 'user-details';
  final String uID;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('User Details Screen \n User Id : ${widget.uID}'),
    );
  }
}
