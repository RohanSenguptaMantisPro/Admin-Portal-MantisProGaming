import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/dashboard/presentation/providers/dashboard_controller.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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
                  decoration: BoxDecoration(
                    color: Colours.backgroundColorDark,
                    border: Border.all(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  child: LayoutBuilder(
                    builder: (layoutContext, boxConstraints) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: boxConstraints.maxWidth * 0.03,
                          right: boxConstraints.maxWidth * 0.03,
                          top: 10,
                        ),
                        //ListView:  So that the column is scrollable if not
                        // enough space.
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: boxConstraints.maxWidth * 0.7,
                                // height: 60,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.red,
                                  ),
                                  image: const DecorationImage(
                                    fit: BoxFit.contain,
                                    image: AssetImage(
                                      'assets/images/mantis_pro_gaming_logo.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colours.backgroundColorDark,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.yellow,
                                  ),
                                ),
                                child: ListView(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                        left: boxConstraints.maxWidth * 0.05,
                                        top: 10,
                                        bottom: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colours.backgroundColorDark,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.orange,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.dashboard,
                                            color: Colours.dashBoardIconColour,
                                          ),
                                          Text(
                                            'Global Dashboard',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colours.backgroundColorDark,
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.purple,
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

              // so tab bard above, add provider listener, so if index changes,
              // based on that with the help of IndexedStack the current index's
              // screen will be shown from the list of screens in
              // DashBoardController.
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colours.backgroundColourLightDark,
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
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
