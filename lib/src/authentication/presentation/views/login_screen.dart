import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/widgets/center_text_box.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colours.backgroundColorDark,
      ),
      child: Stack(
        // stack : to insert a gradient in the middle on top of the column
        children: [
          Column(
            children: [
              Expanded(
                child: Stack(
                  // stack : for the gradient on top of the first part of
                  // the column.
                  children: [
                    // Top image container.
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(MediaRes.loginScreenTopGameCovers),
                          fit: BoxFit.cover,
                        ),
                        // border: Border.all(color: Colors.purple, width: 2),
                      ),
                    ),
                    // Gradient on top image Container.
                    Container(
                      height: context.height,
                      width: context.width,
                      decoration: BoxDecoration(
                        // Gradient for the shadow effect
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colours.loginSceenBlackGradient.withOpacity(0.1),
                            Colours.loginSceenBlackGradient.withOpacity(0.8),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  // stack : to put gradient on top of the 2nd container
                  // container the design svg.
                  children: [
                    // svg.
                    Container(
                      height: context.height,
                      width: context.width,
                      decoration: const BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.yellowAccent,
                          //   width: 2,
                          // ),
                          ),
                      child: SvgPicture.asset(
                        fit: BoxFit.cover,
                        MediaRes.loginScreenBottomDesign,
                      ),
                    ),
                    // gradient layer 1 on top of svg.
                    Container(
                      height: context.height,
                      width: context.width,
                      decoration: BoxDecoration(
                        // Gradient for the shadow effect
                        gradient: RadialGradient(
                          center: Alignment.bottomCenter,
                          // near the top right
                          colors: <Color>[
                            Colours.loginScreenGreenGradient.withOpacity(0.9),
                            Colours.loginScreenGreenGradient.withOpacity(0.9),
                          ],
                        ),
                      ),
                    ),
                    // gradient layer 2.
                    Container(
                      height: context.height,
                      width: context.width,
                      decoration: BoxDecoration(
                        // Gradient for the shadow effect
                        gradient: RadialGradient(
                          center: Alignment.bottomCenter,
                          // near the top right
                          radius: 1.2,
                          colors: <Color>[
                            Colours.loginSceenBlackGradient.withOpacity(0.7),
                            Colours.loginSceenBlackGradient.withOpacity(0.7),
                            Colours.loginSceenBlackGradient.withOpacity(0.7),
                            Colours.loginSceenBlackGradient.withOpacity(0.8),
                            Colours.loginSceenBlackGradient.withOpacity(0.8),
                            Colours.loginSceenBlackGradient.withOpacity(0.9),
                          ],

                          stops: const <double>[
                            0.1,
                            0.2,
                            0.3,
                            0.7,
                            0.8,
                            0.9,
                            // 1,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // gradient in the middle of the column.
          Center(
            child: Container(
              width: double.infinity,
              height: context.height * 0.15,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colours.loginSceenBlackGradient.withOpacity(0.9),
                    blurRadius: 50,
                    spreadRadius: 30,
                  ),
                ],
              ),
            ),
          ),

          //   Center text box.
          const CenterTextBox(),
        ],
      ),
    );
  }
}
