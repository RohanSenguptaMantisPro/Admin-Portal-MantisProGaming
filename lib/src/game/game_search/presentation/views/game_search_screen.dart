import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/game_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/usecases/search_games.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/presentation/bloc/game_search_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/presentation/widgets/search_game_form.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/search/domain/usecases/game_search_results.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/search/presentation/bloc/game_search_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/search/presentation/widgets/data_table.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/search/presentation/widgets/filter_dropdown_tile.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/search/presentation/widgets/pagination_bar.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/search/presentation/widgets/search_game_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameSearchScreen extends StatefulWidget {
  const GameSearchScreen({super.key});

  static const routeName = '/game-search';

  @override
  State<GameSearchScreen> createState() => _GameSearchScreenState();
}

class _GameSearchScreenState extends State<GameSearchScreen> {
  final formKey = GlobalKey<FormState>();
  String? userToken;
  int currentPage = 1;
  int totalPages = 0;
  int totalResults = 0;
  int resultsPerPage = 10;

  final queryTextEditingController = TextEditingController();

  final OverlayPortalController _filterToolTipController =
      OverlayPortalController();
  final LayerLink _filterLayerLink = LayerLink();

  void onTapFilter() {
    setState(_filterToolTipController.toggle);
  }

  @override
  void initState() {
    super.initState();
    userToken = context.read<UserTokenProvider>().userToken;
  }

  @override
  void dispose() {
    queryTextEditingController.dispose();
    super.dispose();
  }

  void changePage(int newPageNumber) {
    currentPage = newPageNumber;
    final gameSearchParameters =
        context.read<GameSearchParameters>().searchParameters;

    if (gameSearchParameters != null) {
      context.read<GameSearchParameters>().updateSearchParam(
            pageNumber: newPageNumber.toString(),
          );

      context.read<GameSearchBloc>().add(
            SearchByEvent(
              userToken: userToken ?? '',
              pageNumber: newPageNumber.toString(),
              limit: gameSearchParameters.limit,
              field: gameSearchParameters.field,
              query: gameSearchParameters.query,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameSearchBloc, GameSearchState>(
      listener: (context, state) {
        if (state is GameSearchError) {
          showErrorNotification(context, state.message);
        } else if (state is FetchedGameData) {
          totalPages =
              (state.gameSearchResponse.totalResults / resultsPerPage).ceil();
          totalResults = state.gameSearchResponse.totalResults;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Container(
                height: 110,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Game Search',
                        style: context.theme.textTheme.titleMedium,
                      ),
                      const Divider(thickness: 0.2, color: Colors.white),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SearchGameForm(
                            onSubmitted: (queryValue) {
                              context
                                  .read<GameSearchParameters>()
                                  .searchParameters = SearchGamesParams(
                                userToken: '',
                                pageNumber: '1',
                                limit: '10',
                                field: '',
                                query: queryTextEditingController.text,
                              );

                              context.read<GameSearchBloc>().add(
                                    SearchGamesEvent(
                                      userToken: userToken ?? '',
                                      pageNumber: '1',
                                      limit: '10',
                                      field: '',
                                      query: queryValue,
                                    ),
                                  );
                            },
                            textEditingController: queryTextEditingController,
                            formKey: formKey,
                          ),
                          CustomDropDown(
                            targetAnchor: Alignment.bottomRight,
                            followerAnchor: Alignment.topRight,
                            tooltipController: _filterToolTipController,
                            layerLink: _filterLayerLink,
                            overlayMenuWidget:
                                FilterDropdown(closeOnSubmit: onTapFilter),
                            buttonWidget: ButtonWidget(
                              buttonBackgroundColor: Colours.greyBackground,
                              borderColor: _filterToolTipController.isShowing
                                  ? Colours.primaryColour
                                  : Colors.white.withOpacity(0.3),
                              onTap: onTapFilter,
                              height: 35,
                              width: 75,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Image(
                                      image: AssetImage(
                                          MediaRes.filterFunnelOutlined),
                                      height: 10,
                                      width: 10,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text('Filter',
                                      style: context.theme.textTheme.bodySmall),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 700,
                width: double.infinity,
                child: (state is GameSearchLoading)
                    ? const Center(
                        child: CircularProgressIndicator(
                            color: Colours.primaryColour))
                    : (state is FetchedGameData)
                        ? SingleChildScrollView(
                            child: GameDataTable(
                                gameDetailsData: state.gameSearchResponse.data),
                          )
                        : const Center(child: Text('No Game Data Available.')),
              ),
              Container(
                height: 70,
                width: double.infinity,
                child: PaginationBar(
                  currentPage: currentPage,
                  totalPages: totalPages,
                  totalResults: totalResults,
                  onPageChanged: changePage,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
