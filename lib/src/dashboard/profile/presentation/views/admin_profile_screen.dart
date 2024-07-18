import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/admin_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/data_containers.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  static const routeName = '/admin-profile';

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
  String accountType = '';

  String name = '';

  String email = '';
  late List<Map<String, String>> userData;

  ImageProvider<Object> adminDisplayPicture = const AssetImage(
    MediaRes.defaultUserImage,
  );

  void _loadProfilePicture(String url) {
    adminDisplayPicture = NetworkImage(url);
    (adminDisplayPicture as NetworkImage)
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
              // Image loaded successfully
            },
            onError: (dynamic exception, StackTrace? stackTrace) {
              debugPrint('Error loading profile picture: $exception');
              debugPrint('Stack trace: $stackTrace');
              setState(() {
                adminDisplayPicture =
                    const AssetImage(MediaRes.defaultUserImage);
              });
            },
          ),
        );
  }

  @override
  void initState() {
    super.initState();

    final AdminDetails? adminProfileData =
        context.read<AdminUserData>().userData;

    // debugPrint('-------Admin Profile data: $adminProfileData');

    if (adminProfileData != null) {
      // debugPrint('----profile pic : ${adminProfileData.displayPicture}');
      accountType = adminProfileData.accountType;
      name = adminProfileData.name;
      email = adminProfileData.email;
      _loadProfilePicture(adminProfileData.displayPicture);
    }

    userData = [
      {'title': 'Name', 'data': name},
      {'title': 'Account Type', 'data': accountType},
      {'title': 'Email', 'data': email},
      // Add more data fields as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (buildContext, state) {
        if (state is AuthError) {
          showErrorNotification(context, 'Could not log you out!');
        } else if (state is LoggedOut) {
          // delete any saved search parameters.
          context.read<UserSearchParameters>().searchParameters = null;

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
                  decoration: const BoxDecoration(
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
                  decoration: const BoxDecoration(
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
                        onBackgroundImageError: (er, s) {
                          debugPrint(s.toString());
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 20,
                        children: userData
                            .map(
                              (data) => DataContainers(
                                height: 30,
                                width: 250,
                                dataText: (data['data']!).isEmpty
                                    ? '--'
                                    : data['data']!,
                                title: data['title']!,
                              ),
                            )
                            .toList(),
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
