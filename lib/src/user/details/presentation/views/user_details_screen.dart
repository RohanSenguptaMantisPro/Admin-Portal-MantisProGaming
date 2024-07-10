import 'package:admin_portal_mantis_pro_gaming/src/user/details/presentation/bloc/user_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({required this.uID, super.key});

  static const routeName = 'user-details';
  final String uID;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    super.initState();

    //   Add UserDetailsEvent with the userID.
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDetailsBloc, UserDetailsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Center(
          child: Text('User Details Screen \n User Id : ${widget.uID}'),
        );
      },
    );
  }
}
