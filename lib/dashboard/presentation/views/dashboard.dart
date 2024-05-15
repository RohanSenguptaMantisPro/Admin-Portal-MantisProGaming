import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:admin_portal_mantis_pro_gaming/dashboard/presentation/widgets/dashboard_container.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  // TODO(RohanSengupta): Later add on the mediaQuery screen responsiveness.
  // with the conditions available here:
  // core/utils/responsive_screen_utils.dart

  // start from smallest screen, configure unto big screens.

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (_, dashboardController, __) {
        return Scaffold(
          backgroundColor: Colours.backgroundColourLightDark,
          body: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colours.backgroundColorDark,
                    // border: Border.all(
                    //   color: Colors.green,
                    // ),
                  ),
                  child: LayoutBuilder(
                    builder: (layoutContext, boxConstraints) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 7,
                          right: 7,
                          top: 10,
                        ),
                        //ListView:  So that the column is scrollable if not
                        // enough space.
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: 150,
                                // height: 60,
                                decoration: const BoxDecoration(
                                  // border: Border.all(
                                  //   width: 2,
                                  //   color: Colors.red,
                                  // ),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    // TODO(RohanSengupta): Because of this fit
                                    // the images tries to fit in, so when the
                                    // box gets small the image also gets small.
                                    // to be changed to don't shrink the
                                    // dashboard after a certain point.
                                    image: AssetImage(
                                      MediaRes.mantisProGamingLogo,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
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
                                      height: 15,
                                    ),
                                    DashboardContainer(
                                      currentPageIndex: 0,
                                      changeIndexFunction:
                                          dashboardController.changeIndex,
                                      icon: Icons.dashboard,
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
                                      icon: Icons.supervisor_account,
                                      title: 'User Search',
                                      isCurrentPageActive:
                                          dashboardController.currentIndex == 1
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
                                      icon: Icons.watch_later,
                                      title: 'Time Tracking',
                                      isCurrentPageActive:
                                          dashboardController.currentIndex == 2
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
                                      icon: Icons.confirmation_num_outlined,
                                      title: 'Incentives',
                                      isCurrentPageActive:
                                          dashboardController.currentIndex == 3
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
                                      icon: Icons.gamepad,
                                      title: 'Feedback',
                                      isCurrentPageActive:
                                          dashboardController.currentIndex == 4
                                              ? true
                                              : false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                ),
                                // TODO(RohanSengupta): get admin details
                                // dynamically after admin signs in.
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(MediaRes.defaultUserImage),
                                    radius: 18,
                                  ),
                                  title: Text(
                                    'Admin Name',
                                    style: context.theme.textTheme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    'Admin',
                                    style: context.theme.textTheme.bodySmall!
                                        .copyWith(
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),

              // so tab board above, add provider listener, so if index changes,
              // based on that with the help of IndexedStack the current index's
              // screen will be shown from the list of screens in
              // DashBoardController.
              Expanded(
                flex: 6,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colours.backgroundColourLightDark,
                    border: Border(
                      left: BorderSide(
                        color: Colours.lightTextColour,
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
  }
}
