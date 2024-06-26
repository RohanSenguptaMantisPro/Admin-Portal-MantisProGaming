import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/admin_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_toast.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/profile/presentation/widgets/data_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/res/colours.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminDetails? adminProfileData =
        context.read<AdminUserData>().userData;

    late String accountType;
    late String name;
    late String email;
    late ImageProvider<Object> adminDisplayPicture;

    if (adminProfileData != null) {
      adminDisplayPicture = NetworkImage(
        adminProfileData.displayPicture,
      );
      accountType = adminProfileData.accountType;
      name = adminProfileData.name;
      email = adminProfileData.email;
    } else if (adminProfileData == null) {
      adminDisplayPicture = const AssetImage(
        MediaRes.defaultUserImage,
      );
      accountType = '--';
      name = '--';
      email = '--';
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (buildContext, state) {
        if (state is AuthError) {
          showCustomToast(context, 'Could not log you out!');
        } else if (state is LoggedOut) {
          context.go('/');
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colours.primaryColour,
                      // ),
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Logged In',
                        style: context.theme.textTheme.titleMedium,
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Container(
                  height: 550,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.purple,
                      // ),
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: adminDisplayPicture,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          DataContainers(
                            height: 30,
                            width: 250,
                            dataText: name.isEmpty ? '--' : name,
                            title: 'Name',
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          DataContainers(
                            height: 30,
                            width: 250,
                            dataText: accountType.isEmpty ? '--' : accountType,
                            title: 'Account Type',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      DataContainers(
                        height: 30,
                        width: 270,
                        dataText: email.isEmpty ? '--' : email,
                        title: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (state is AuthLoading)
                        const CircularProgressIndicator(
                          color: Colours.primaryColour,
                        )
                      else
                        ButtonWidget(
                          onTap: () => context.read<AuthBloc>().add(
                                const LogOutEvent(),
                              ),
                          height: 35,
                          width: 100,
                          borderColor: Colors.white.withOpacity(0.3),
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: context.theme.textTheme.bodySmall,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
