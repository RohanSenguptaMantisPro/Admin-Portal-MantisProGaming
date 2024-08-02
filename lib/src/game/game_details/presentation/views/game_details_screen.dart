import 'package:admin_portal_mantis_pro_gaming/core/common/widget/breadcrumb.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/bloc/game_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailsScreen extends StatefulWidget {
  const GameDetailsScreen({required this.gameID, super.key});

  static const routeName = 'game-details';
  static const pageName = 'Game Details';

  final String gameID;

  @override
  State<GameDetailsScreen> createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameDetailsBloc, GameDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return LayoutBuilder(
          builder: (_, boxConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 1200,
                    minHeight: 950,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 60,
                          bottom: 25,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  // border: Border.all(
                                  //   color: Colours.primaryColour,
                                  // ),
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //route navigation path here.
                                  Breadcrumb(),

                                  Text(
                                    'Game Details',
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

                            //GAME IMAGE ASSET UI HERE

                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 500,
                              ),
                              child: Container(
                                decoration: const BoxDecoration(
                                    // border: Border.all(
                                    //   color: Colors.purple,
                                    // ),
                                    ),
                                //Because first initialState is emitted.
                                // to handle that.
                                child: (state is GameDetailsInitial ||
                                        state is GettingGameDetails)
                                    ? const Center(
                                        child: CircularProgressIndicator(
                                          color: Colours.primaryColour,
                                        ),
                                      )
                                    : Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Container(
                                          //   width: boxConstraints.maxWidth * 0.7,
                                          //   alignment: Alignment.topLeft,
                                          //   child: Wrap(
                                          //     spacing: 20,
                                          //     runSpacing: 30,
                                          //     children: [
                                          //       ...userData.map(
                                          //         (data) => DataContainers(
                                          //           height: 35,
                                          //           width: double.parse(
                                          //             data['width']!,
                                          //           ),
                                          //           dataText:
                                          //               (data['data']!).isEmpty
                                          //                   ? '--'
                                          //                   : data['data']!,
                                          //           title: data['title']!,
                                          //         ),
                                          //       ),
                                          //       DropDown(
                                          //         title: 'Account Status',
                                          //         // Converting items of AccountStatus
                                          //         // enum to DropdownMenuItem<String>
                                          //         // for dropdown options.
                                          //         menuItemList:
                                          //             AccountStatusDropDownMenu
                                          //                 .values
                                          //                 .map<
                                          //                     DropdownMenuItem<
                                          //                         String>>((
                                          //           AccountStatusDropDownMenu
                                          //               accountStatus,
                                          //         ) {
                                          //           return DropdownMenuItem<String>(
                                          //             value: accountStatus.value,
                                          //             child:
                                          //                 Text(accountStatus.value),
                                          //           );
                                          //         }).toList(),
                                          //         onChanged: (newValue) {
                                          //           accountStatus = newValue;
                                          //         },
                                          //         initialValue: accountStatus,
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                        ],
                                      ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: (state is UpdatingGameDetails)
                                  ? const CircularProgressIndicator(
                                      color: Colours.primaryColour,
                                    )
                                  : ButtonWidget(
                                      onTap: () => (),
                                      //update user details bloc event add.
                                      // (state is GameDetailsError)
                                      //     ? ()
                                      //     : context.read<GameDetailsBloc>().add(
                                      //           UpdateGameDetailsEvent(
                                      //             updateGameDetailsParams:
                                      //                 UpdateGameDetailsParams(
                                      //               userToken: userToken ?? '',
                                      //
                                      //               gameObjectId: widget.gameID,
                                      //                   gameName: ''
                                      //             ),
                                      //           ),
                                      //         ),

                                      width: 150,
                                      height: 35,
                                      buttonBackgroundColor:
                                          (state is GameDetailsError)
                                              ? Colours.greyBackground
                                              : Colours.primaryColour,
                                      title: 'Save Changes',
                                      textStyle: (state is GameDetailsError)
                                          ? TextStyle(
                                              color: Colours.greyTextColour,
                                            )
                                          : null,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        height: 15,
                        color: Colours.backgroundColorDark,
                      ),
                      const SizedBox(
                        height: 130,
                        child: Center(
                          child: Text('Advanced Details'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
