import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_toast.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/authentication/presentation/widgets/center_text_box.dart';
import 'package:admin_portal_mantis_pro_gaming/src/dashboard/presentation/views/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // context.read<AuthBloc>().add(
    //       const IsUserLoggedInEvent(),
    //     );
  }

  @override
  Widget build(BuildContext context) {
    String receivedUserToken = '';

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // checking if user is logged in
        if (state is IsLoggedInStatus && state.isLoggedIn == true) {
          Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
        } // if couldn't auto log user in.
        else if (state is LoggedInCheckFailed) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Could not auto log in user'),
          //   ),
          // );
          showCustomToast(context, 'Auto login failed, please login');
        } // if any error.
        else if (state is AuthError) {
          debugPrint('----- listener state : $state');
          debugPrint('----- Something went wrong : ${state.message}');
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Something went wrong'),
          //   ),
          // );
          showCustomToast(context, 'Something Went Wrong');
        } //on button click userToken received and saved.
        else if (state is CreatedUser && state.userToken.isNotEmpty) {
          receivedUserToken = state.userToken;
          context.read<AuthBloc>().add(
                IsAdminEvent(userToken: state.userToken),
              );
        } // check admin or not.
        else if (state is AdminCheckStatus && state.isAdmin == true) {
          context.read<AuthBloc>().add(
                CacheUserTokenEvent(receivedUserToken),
              );
        } else if (state is AdminCheckStatus && state.isAdmin == false) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text("You don't have Admin Permissions"),
          //   ),
          showCustomToast(context, 'You do not have Admin Permission');
        } //if all ok and cachedUserToken go to dashboard page.
        else if (state is CachedUserToken) {
          Navigator.of(context).pushReplacementNamed(Dashboard.routeName);
        }
      },

      //
      builder: (context, state) {
        // don't show login page if checking user token status.
        debugPrint('---- new state : $state');
        if (state is CheckingIsUserLoggedIn) {
          return const CircularProgressIndicator();
        } else {
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
                              // border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage(MediaRes.loginScreenTopCover),
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
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.1),
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.8),
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
                                  Colours.loginScreenGreenGradient
                                      .withOpacity(0.9),
                                  Colours.loginScreenGreenGradient
                                      .withOpacity(0.9),
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
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.7),
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.7),
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.7),
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.8),
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.8),
                                  Colours.loginSceenBlackGradient
                                      .withOpacity(0.9),
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
                          color:
                              Colours.loginSceenBlackGradient.withOpacity(0.9),
                          blurRadius: 50,
                          spreadRadius: 30,
                        ),
                      ],
                    ),
                  ),
                ),

                //   Center text box.
                CenterTextBox(
                  childButton: //for authLoadings show indicator else
                      // just the button.
                      (state is AuthLoading)
                          ? const CircularProgressIndicator(
                              color: Colours.primaryColour,
                            )
                          : SizedBox(
                              width: 270,
                              height: 40,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  //  ADD BLOC EVENT
                                  context.read<AuthBloc>().add(
                                        const CreateUserEvent(),
                                      );
                                },
                                style: ButtonStyle(
                                  backgroundColor: const WidgetStatePropertyAll(
                                    Colours.primaryColour,
                                  ),
                                  shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                icon: Image.asset(
                                  MediaRes.googleIcon,
                                  width: 15,
                                  height: 15,
                                ),
                                label: Text(
                                  'Continue with Google',
                                  style: context.theme.textTheme.bodyMedium,
                                ),
                              ),
                            ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
