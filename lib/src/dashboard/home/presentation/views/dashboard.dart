import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/admin_user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/domain/entities/admin_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/home/presentation/widgets/dashboard_container.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/profile/presentation/views/admin_profile_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/feedback/presentation/views/feedback_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/presentation/views/game_search_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/global_dashboard/presentation/views/global_dashboard_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/incentives/presentation/views/incentives_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/push_notifications/presentation/views/push_notifications_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/time_tracking/presentation/views/time_tracking_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/views/user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({required this.child, super.key});

  final Widget child;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String _activeRoute = UserSearchScreen.routeName;

  void setActiveRoute(String routePath) {
    setState(() {
      _activeRoute = routePath;
    });
    context.go(routePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.backgroundColourLightDark,
      body: Row(
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
                          goRouter: () => setActiveRoute(
                            GlobalDashboardScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == GlobalDashboardScreen.routeName,
                          iconAsset:
                              (_activeRoute == GlobalDashboardScreen.routeName)
                                  ? MediaRes.codeBrowserFilled
                                  : MediaRes.codeBrowser,
                          title: 'Global Dashboard',
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DashboardContainer(
                          iconAsset:
                              (_activeRoute == UserSearchScreen.routeName)
                                  ? MediaRes.userFilled
                                  : MediaRes.userOutlined,
                          title: 'User Search',
                          goRouter: () => setActiveRoute(
                            UserSearchScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == UserSearchScreen.routeName,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DashboardContainer(
                          iconAsset:
                              (_activeRoute == GameSearchScreen.routeName)
                                  ? MediaRes.consoleFilled
                                  : MediaRes.console,
                          title: 'Game Search',
                          goRouter: () => setActiveRoute(
                            GameSearchScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == GameSearchScreen.routeName,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DashboardContainer(
                          iconAsset:
                              (_activeRoute == TimeTrackingScreen.routeName)
                                  ? MediaRes.clockIconFilled
                                  : MediaRes.clockIcon,
                          title: 'Time Tracking',
                          goRouter: () => setActiveRoute(
                            TimeTrackingScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == TimeTrackingScreen.routeName,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DashboardContainer(
                          iconAsset:
                              (_activeRoute == IncentivesScreen.routeName)
                                  ? MediaRes.localActivityFilled
                                  : MediaRes.localActivity,
                          title: 'Incentives',
                          goRouter: () => setActiveRoute(
                            IncentivesScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == IncentivesScreen.routeName,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DashboardContainer(
                          iconAsset: (_activeRoute ==
                                  PushNotificationsScreen.routeName)
                              ? MediaRes.bellFilled
                              : MediaRes.bell,
                          title: 'Push Notifications',
                          goRouter: () => setActiveRoute(
                            PushNotificationsScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == PushNotificationsScreen.routeName,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DashboardContainer(
                          iconAsset: (_activeRoute == FeedbackScreen.routeName)
                              ? MediaRes.consoleFilled
                              : MediaRes.console,
                          title: 'Feedback',
                          goRouter: () => setActiveRoute(
                            FeedbackScreen.routeName,
                          ),
                          isCurrentPageActive:
                              _activeRoute == FeedbackScreen.routeName,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const Divider(),
                  InkWell(
                    onTap: () => context.go(AdminProfileScreen.routeName),
                    child: Builder(
                      builder: (_) {
                        final AdminDetails? adminProfileData =
                            context.read<AdminUserData>().userData;

                        debugPrint(
                          'AdminProfileScreen: fetched user data '
                          ': $adminProfileData',
                        );

                        late ImageProvider<Object> adminDisplayPicture;
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
                              backgroundImage: adminDisplayPicture,
                              onBackgroundImageError: (exception, stackTrace) {
                                // Use default image on error
                                debugPrint('------Could not load user image,'
                                    ' error : $exception');
                              },
                              radius: 18,
                            ),
                            title: Text(
                              adminProfileData != null
                                  ? adminProfileData.name
                                  : 'Admin Username',
                              style: context.theme.textTheme.bodySmall,
                            ),
                            subtitle: Text(
                              'Admin',
                              style:
                                  context.theme.textTheme.bodySmall!.copyWith(
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
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
