import 'dart:async';

import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/admin_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_toast.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/home/presentation/providers/dashboard_controller.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/home/presentation/widgets/dashboard_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  const Dashboard({required this.autoLogIn, super.key});

  final int autoLogIn;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // auto login user if token is saved.
    debugPrint('---checking user logged in');
    debugPrint(
      '--------${widget.autoLogIn}',
    );
    if (widget.autoLogIn == 1) {
      context.read<AuthBloc>().add(
            const IsUserLoggedInEvent(),
          );
    }
  }

  // TODO(RohanSengupta): Later add on the mediaQuery screen responsiveness.
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (_, dashboardController, __) {
        return BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state is IsLoggedInStatus &&
                state.loggedInUserToken.isNotEmpty) {
              // here if logged in initialise the setter with the received
              // userToken
              // to access elsewhere too.
              debugPrint(
                '------------ user already logged in. '
                '${state.loggedInUserToken}',
              );
              context
                  .read<UserTokenProvider>()
                  .initUser(state.loggedInUserToken);

              // fetch admin profile data bloc event add here. and then setter
              // to
              // store user data.
              context.read<AuthBloc>().add(
                    FetchAdminDataEvent(
                      userToken: state.loggedInUserToken,
                    ),
                  );
            } // if couldn't auto log user in.
            else if (state is LoggedInCheckFailed) {
              showCustomToast(context, 'Auto login failed, please login');
              context.read<AuthBloc>().add(
                    const LogOutEvent(),
                  );

              context.go('/');
            } else if (state is FetchAdminDataError) {
              showCustomToast(context, 'Unable to access Admin Data');
            } else if (state is FetchedAdminData) {
              context.read<AdminUserData>().initUser(state.adminDetails);
            } else if (state is LoggedOut) {
              await Future<void>.delayed(const Duration(seconds: 1));
              dashboardController.changeIndex(1);
            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colours.backgroundColourLightDark,
              body: (state is AuthLoading)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colours.primaryColour,
                      ),
                    )
                  : Row(
                      children: [
                        Container(
                          width: 250,
                          decoration: const BoxDecoration(
                            color: Colours.backgroundColorDark,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 7,
                              right: 7,
                              top: 20,
                            ),
                            //ListView:  So that the column is scrollable
                            // if not
                            // enough space.
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 150,
                                  // height: 60,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      // TODO(RohanSengupta): Because of this fit
                                      // the images tries to fit in, so when the
                                      // box gets small the image also gets small.
                                      // to be changed to don't shrink the
                                      // dashboard after a certain point.
                                      image: AssetImage(
                                        MediaRes.darkVersionMantisProGamingLogo,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 500,
                                  decoration: const BoxDecoration(
                                    color: Colours.backgroundColorDark,
                                    // border: Border.all(
                                    //   width: 2,
                                    //   color: Colors.yellow,
                                    // ),
                                  ),
                                  child: ListView(
                                    children: [
                                      const SizedBox(
                                        height: 35,
                                      ),
                                      DashboardContainer(
                                        currentPageIndex: 0,
                                        changeIndexFunction:
                                            dashboardController.changeIndex,
                                        iconAsset: MediaRes.codeBrowser,
                                        title: 'Global Dashboard',
                                        isCurrentPageActive:
                                            (dashboardController.currentIndex ==
                                                    0)
                                                ? true
                                                : false,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      DashboardContainer(
                                        currentPageIndex: 1,
                                        changeIndexFunction:
                                            dashboardController.changeIndex,
                                        iconAsset: MediaRes.usersFilled,
                                        title: 'User Search',
                                        isCurrentPageActive:
                                            dashboardController.currentIndex ==
                                                    1
                                                ? true
                                                : false,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      DashboardContainer(
                                        currentPageIndex: 2,
                                        changeIndexFunction:
                                            dashboardController.changeIndex,
                                        iconAsset: MediaRes.clockIcon,
                                        title: 'Time Tracking',
                                        isCurrentPageActive:
                                            dashboardController.currentIndex ==
                                                    2
                                                ? true
                                                : false,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      DashboardContainer(
                                        currentPageIndex: 3,
                                        changeIndexFunction:
                                            dashboardController.changeIndex,
                                        iconAsset: MediaRes.localActivity,
                                        title: 'Incentives',
                                        isCurrentPageActive:
                                            dashboardController.currentIndex ==
                                                    3
                                                ? true
                                                : false,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      DashboardContainer(
                                        currentPageIndex: 4,
                                        changeIndexFunction:
                                            dashboardController.changeIndex,
                                        iconAsset: MediaRes.console,
                                        title: 'Feedback',
                                        isCurrentPageActive:
                                            dashboardController.currentIndex ==
                                                    4
                                                ? true
                                                : false,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                const Divider(),
                                InkWell(
                                  onTap: () =>
                                      dashboardController.changeIndex(5),
                                  child: Builder(
                                    builder: (_) {
                                      final AdminDetails? adminProfileData =
                                          context
                                              .read<AdminUserData>()
                                              .userData;

                                      late ImageProvider<Object>
                                          adminDisplayPicture;
                                      if (adminProfileData != null) {
                                        adminDisplayPicture = NetworkImage(
                                          adminProfileData.displayPicture,
                                        );
                                      } else {
                                        adminDisplayPicture = const AssetImage(
                                          MediaRes.defaultUserImage,
                                        );
                                      }

                                      return Container(
                                        height: 65,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            // border: Border.all(
                                            //   width: 3,
                                            //   color: Colors.purple,
                                            // ),
                                            ),
                                        child: ListTile(
                                          mouseCursor: SystemMouseCursors.click,
                                          minVerticalPadding: 0,
                                          contentPadding: EdgeInsets.all(0),
                                          leading: CircleAvatar(
                                            backgroundImage:
                                                adminDisplayPicture,
                                            onBackgroundImageError:
                                                (exception, stackTrace) {
                                              // Use default image on error
                                              debugPrint(
                                                  '------Could not load user image,'
                                                  ' error : $exception');
                                            },
                                            radius: 18,
                                          ),
                                          title: Text(
                                            adminProfileData != null
                                                ? adminProfileData.name
                                                : 'Admin Username',
                                            style: context
                                                .theme.textTheme.bodySmall,
                                          ),
                                          subtitle: Text(
                                            'Admin',
                                            style: context
                                                .theme.textTheme.bodySmall!
                                                .copyWith(
                                              fontSize: 10,
                                              color: Colours.greyTextColour,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // so tab board above, add provider listener, so if index changes,
                        // based on that with the help of IndexedStack the current index's
                        // screen will be shown from the list of screens in
                        // DashBoardController.
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colours.backgroundColourLightDark,
                              border: Border(
                                left: BorderSide(
                                  color: Colours.grey,
                                ),
                              ),
                            ),

                            // IndexedStack takes a list of screens & shows the screen
                            // according to the index argument it has which stored the
                            // current index.
                            // now to navigate between indexes we use dashboardController
                            // & Provider
                            // to call methods to change indexes and stuff.
                            child: IndexedStack(
                              index: dashboardController.currentIndex,
                              children: dashboardController.screens,
                            ),
                          ),
                        ),
                      ],
                    ),
            );
          },
        );
      },
    );
  }
}
