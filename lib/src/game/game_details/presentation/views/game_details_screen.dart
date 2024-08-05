import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/breadcrumb.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/data_containers.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/entities/game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/domain/usecases/get_game_details.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/bloc/game_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
  void initState() {
    super.initState();

    //fetch game details.
    context.read<GameDetailsBloc>().add(
          GetGameDetailsEvent(
            getGameDetailsParams: GetGameDetailsParams(
              gameObjectId: widget.gameID,
              userToken: context.read<UserTokenProvider>().userToken ?? '',
            ),
          ),
        );
  }

  final gameNameEditingController = TextEditingController();

  String gameName = '';
  List<Map<String, String>> gameDetails = [
    {
      'title': 'Game ID',
      'data': '',
      'width': '260',
    },
    {
      'title': 'Game Name',
      'data': '',
      'width': '220',
    },
    {
      'title': 'Package Name',
      'data': '',
      'width': '250',
    },
    {
      'title': 'Times Added to Mantis',
      'data': '',
      'width': '250',
    },
    {
      'title': 'Times Played with Mantis',
      'data': '',
      'width': '270',
    },
    {
      'title': 'Created At',
      'data': '',
      'width': '260',
    },
    {
      'title': 'Updated At',
      'data': '',
      'width': '200',
    },

    // Add more data fields as needed{'title': 'Game Name', 'data': '', 'width' : },
  ];

  void updateGameDetails(GameDetails details) {
    gameDetails = [
      {'title': 'Game ID', 'data': details.id ?? '', 'width': '260'},
      {'title': 'Game Name', 'data': details.name ?? '', 'width': '220'},
      {
        'title': 'Package Name',
        'data': details.packageName ?? '',
        'width': '250'
      },
      {
        'title': 'Times Added to Mantis',
        'data': details.timesAdded?.toString() ?? '',
        'width': '250'
      },
      {
        'title': 'Times Played with Mantis',
        'data': details.timesPlayed?.toString() ?? '',
        'width': '270'
      },
      {
        'title': 'Created At',
        'data': details.createdAt != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(DateTime.parse(details.createdAt!))
            : '',
        'width': '260'
      },
      {
        'title': 'Updated At',
        'data': details.updatedAt != null
            ? DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(DateTime.parse(details.updatedAt!))
            : '',
        'width': '200'
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameDetailsBloc, GameDetailsState>(
      listener: (context, state) {
        if (state is GameDetailsError || state is GameImageError) {
          showErrorNotification(
            context,
            'Some data could not be loaded!',
          );
        } else if (state is GotGameDetails) {
          debugPrint('------------- Game Details :${state.gameDetails}\n');

          gameName = state.gameDetails.name ?? '';
          updateGameDetails(state.gameDetails);
        } else if (state is UpdatedGameDetails) {
          // debugPrint('Updated User Details.');
          showSuccessNotification(
            context,
            'Success! Updated Game Details.',
          );
        }
      },
      builder: (context, state) {
        return LayoutBuilder(
          builder: (_, boxConstraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Container(
                  width: boxConstraints.maxWidth,
                  constraints: const BoxConstraints(
                    minHeight: 950,
                    minWidth: 1200,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colours.redColour),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          top: 64,
                          bottom: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //this container takes the full available width
                            // because Divider is one of the children.
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colours.primaryColour,
                                ),
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
                                  //divider takes the whole available width.
                                  const Divider(
                                    thickness: 0.2,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                            Container(
                              color: Colours.primaryColour,
                              height: 200,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.purple,
                                ),
                              ),
                              constraints: const BoxConstraints(
                                minHeight: 550,
                              ),
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
                                        Container(
                                          width: boxConstraints.maxWidth * 0.7,
                                          alignment: Alignment.topLeft,
                                          child: Wrap(
                                            spacing: 20,
                                            runSpacing: 30,
                                            children: [
                                              ...gameDetails.map(
                                                (data) => DataContainers(
                                                  height: 35,
                                                  width: double.parse(
                                                    data['width']!,
                                                  ),
                                                  dataText:
                                                      (data['data']!).isEmpty
                                                          ? '--'
                                                          : data['data']!,
                                                  title: data['title']!,
                                                ),
                                              ),


                                            ],
                                          ),
                                        ),
                                      ],
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
