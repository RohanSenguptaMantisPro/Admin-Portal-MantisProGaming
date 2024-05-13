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
                        padding: EdgeInsets.all(
                          boxConstraints.maxWidth * 0.1,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/mantis_pro_gaming_logo.png',
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
                    color: Colours.backgroundColorDark,
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
