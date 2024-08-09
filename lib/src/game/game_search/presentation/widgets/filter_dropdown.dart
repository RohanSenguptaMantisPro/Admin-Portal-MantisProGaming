import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/game_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/enum/game_search_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/drop_down.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/presentation/bloc/game_search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameSearchFilterDropdown extends StatefulWidget {
  const GameSearchFilterDropdown({required this.closeOnSubmit, super.key});

  final VoidCallback closeOnSubmit;

  @override
  State<GameSearchFilterDropdown> createState() =>
      _GameSearchFilterDropdownState();
}

class _GameSearchFilterDropdownState extends State<GameSearchFilterDropdown> {
  final formKey = GlobalKey<FormState>();
  final queryTextEditingController = TextEditingController();
  GameSearchByDropDownMenu searchByOption = GameSearchByDropDownMenu.none;

  @override
  void initState() {
    super.initState();

    final gameSearchParameters =
        context.read<GameSearchParameters>().searchParameters;

    if (gameSearchParameters != null) {
      searchByOption = GameSearchByDropDownMenu.values.firstWhere(
        (e) => e.value == gameSearchParameters.field,
        orElse: () => GameSearchByDropDownMenu.none,
      );
      queryTextEditingController.text = gameSearchParameters.query;
    }
  }

  void resetFields() {
    setState(() {
      searchByOption = GameSearchByDropDownMenu.none;
      queryTextEditingController.clear();
    });

    context.read<GameSearchParameters>().searchParameters = null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameSearchParameters>(
      builder: (_, gameSearchParameters, __) {
        return Container(
          margin: const EdgeInsets.only(top: 8),
          width: 400,
          height: 250,
          decoration: ShapeDecoration(
            color: Colours.backgroundColourLightDark,
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colours.grey),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // searchBy dropdown
                  DropDown(
                    dropdownWidth: double.infinity,
                    dropdownHeight: 35,
                    title: 'Search By',
                    menuItemList: GameSearchByDropDownMenu.values
                        .map<DropdownMenuItem<String>>((
                      GameSearchByDropDownMenu searchByMenu,
                    ) {
                      return DropdownMenuItem<String>(
                        value: searchByMenu.value,
                        child: Text(searchByMenu.value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      searchByOption =
                          GameSearchByDropDownMenu.values.firstWhere(
                        (e) => e.value == newValue,
                        orElse: () => GameSearchByDropDownMenu.none,
                      );
                    },
                    initialValue: searchByOption.value,
                  ),

                  const SizedBox(height: 20),

                  const Text('Keyword Search'),
                  SizedBox(
                    width: double.infinity,
                    height: 33,
                    child: Form(
                      key: formKey,
                      child: IField(
                        controller: queryTextEditingController,
                        hintText: 'Search',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colours.lightWhiteIconColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        buttonBackgroundColor: Colours.greyBackground,
                        onTap: resetFields,
                        width: 60,
                        height: 35,
                        title: 'Reset',
                        textStyle: const TextStyle(
                          color: Colours.whiteTextColour,
                        ),
                      ),
                      ButtonWidget(
                        onTap: () {
                          final userToken =
                              context.read<UserTokenProvider>().userToken;

                          context
                              .read<GameSearchParameters>()
                              .searchParameters = SearchGamesParams(
                            userToken: '',
                            pageNumber: '1',
                            limit: '10',
                            field: searchByOption.value,
                            query: queryTextEditingController.text,
                          );

                          context.read<GameSearchBloc>().add(
                                SearchGamesEvent(
                                  searchGamesParams: SearchGamesParams(
                                    userToken: userToken ?? '',
                                    pageNumber: '1',
                                    limit: '10',
                                    field: searchByOption ==
                                            GameSearchByDropDownMenu.none
                                        ? ''
                                        : searchByOption.value,
                                    query: queryTextEditingController.text,
                                  ),
                                ),
                              );

                          widget.closeOnSubmit();
                        },
                        width: 70,
                        height: 35,
                        buttonBackgroundColor: Colours.primaryColour,
                        title: 'Search',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
