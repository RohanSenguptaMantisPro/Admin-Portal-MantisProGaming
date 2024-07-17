import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/enum/account_status_dropdown_menu.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/enum/search_by_dropdown_menu.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/drop_down.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/bloc/user_search_bloc.dart';

import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/data_table.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/filter_dropdown_tile.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/pagination_bar.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/search_user_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  static const routeName = '/user-search';

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final formKey = GlobalKey<FormState>();
  String? userToken;
  int currentPage = 1;
  int totalPages = 0;
  int totalResults = 0;
  int resultsPerPage = 10;

  String accountStatusOption = AccountStatusDropDownMenu.unrestricted.value;
  String searchByOptions = SearchByDropDownMenu.none.value;

  final queryTextEditingController = TextEditingController();

  // for [filter] dropdown overlay.
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

    // Fetch same fields as selected before and stored in provider
    // and put in blocEvent.
    final userSearchParameters =
        context.read<UserSearchParameters>().searchParameters;

    // debugPrint('-----change page params : $userSearchParameters');

    if (userSearchParameters != null) {
      // saving the newPageNumber too.
      context.read<UserSearchParameters>().updateSearchParam(
            pageNumber: newPageNumber.toString(),
          );

      context.read<UserSearchBloc>().add(
            SearchByEvent(
              userToken: userToken ?? '',
              pageNumber: newPageNumber.toString(),
              limit: userSearchParameters.limit,
              field: userSearchParameters.field,
              query: userSearchParameters.query,
              country: userSearchParameters.country,
              accountStatus: userSearchParameters.accountStatus,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserSearchBloc, UserSearchState>(
      listener: (context, state) {
        debugPrint('-------UserSearchScreen Current State : $state');

        if (state is UserSearchError) {
          debugPrint('----- listener state : $state');
          debugPrint('----- Something went wrong : ${state.message}');

          showSuccessNotification(
            context,
            state.message,
          );
        } else if (state is FetchedUserData) {
          debugPrint('--------UserSearch Screen :state is fetchedUserData');

          totalPages =
              (state.userSearchResponse.totalResults / resultsPerPage).ceil();
          totalResults = state.userSearchResponse.totalResults;
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 110,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // border: Border.all(
                    //   color: Colours.primaryColour,
                    // ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'User Search',
                        style: context.theme.textTheme.titleMedium,
                      ),
                      const Divider(
                        thickness: 0.2,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // AccountTypeDropdown,
                              DropDown(
                                dropdownHeight: 40,
                                dropdownWidth: 200,
                                menuItemList: AccountStatusDropDownMenu.values
                                    .map<DropdownMenuItem<String>>((
                                  AccountStatusDropDownMenu accountStatus,
                                ) {
                                  return DropdownMenuItem<String>(
                                    value: accountStatus.value,
                                    child: Text(accountStatus.value),
                                  );
                                }).toList(),
                                initialValue: accountStatusOption,
                                onChanged: (newValue) {
                                  accountStatusOption = newValue;
                                },
                              ),

                              const SizedBox(width: 8),

                              // Search user text field.
                              SearchUserForm(
                                onSubmitted: (queryValue) {
                                  //save parameters setter for next page
                                  // fetches.
                                  context
                                          .read<UserSearchParameters>()
                                          .searchParameters =
                                      UserSearchResultsParams(
                                    userToken: '',
                                    pageNumber: '1',
                                    limit: '10',
                                    field: searchByOptions,
                                    query: queryTextEditingController.text,
                                    country: 'india',
                                    accountStatus: accountStatusOption,
                                  );

                                  //Add SearchByEvent.
                                  // even though here no searchByOptions
                                  //still saving adding it cause else
                                  //on filter button dropdown, it won't be
                                  // able to show saved dropdown parameters.
                                  // cause '' isn't in the list of the dropdown.
                                  context.read<UserSearchBloc>().add(
                                        SearchByEvent(
                                          userToken: userToken ?? '',
                                          pageNumber: '1',
                                          limit: '10',
                                          field: searchByOptions ==
                                                  SearchByDropDownMenu
                                                      .none.value
                                              ? ''
                                              : searchByOptions,
                                          query: queryValue,
                                          country: 'india',
                                          accountStatus: accountStatusOption,
                                        ),
                                      );
                                },
                                textEditingController:
                                    queryTextEditingController,
                                formKey: formKey,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // sort button
                              /*ButtonWidget(
                            borderColor: Colors.white.withOpacity(0.3),
                            height: 35,
                            width: 67,
                            onTap: () => (),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image(
                                    image: AssetImage(
                                      MediaRes.sortOutlined,
                                    ),
                                    height: 10,
                                    width: 10,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Sort',
                                  style: context.theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),*/
                              const SizedBox(
                                width: 10,
                              ),
                              // filter dropdown.
                              StatefulBuilder(
                                builder:
                                    (BuildContext ctx, StateSetter setState) {
                                  return CustomDropDown(
                                    targetAnchor: Alignment.bottomRight,
                                    followerAnchor: Alignment.topRight,
                                    tooltipController: _filterToolTipController,
                                    layerLink: _filterLayerLink,
                                    overlayMenuWidget: FilterDropdown(
                                      closeOnSubmit: onTapFilter,
                                    ),
                                    buttonWidget: ButtonWidget(
                                      borderColor:
                                          _filterToolTipController.isShowing
                                              ? Colours.primaryColour
                                              : Colors.white.withOpacity(0.3),
                                      onTap: onTapFilter,
                                      height: 35,
                                      width: 75,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Image(
                                              image: AssetImage(
                                                MediaRes.filterFunnelOutlined,
                                              ),
                                              height: 10,
                                              width: 10,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            'Filter',
                                            style: context
                                                .theme.textTheme.bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ],
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
                decoration: const BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.purple,
                    // ),
                    ),
                child: (state is UserSearchLoading)
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colours.primaryColour,
                        ),
                      )
                    : (state is FetchedUserData)
                        ? SingleChildScrollView(
                            child: UserDataTable(
                              userDetailsData: state.userSearchResponse.data,
                            ),
                          )
                        : const Center(
                            child: Text('No User Data Available.'),
                          ),
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.blue,
                    // ),
                    ),
                child: PaginationBar(
                  currentPage: currentPage,
                  totalPages: totalPages,
                  totalResults: totalResults,
                  onPageChanged: changePage,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        );
      },
    );
  }
}
