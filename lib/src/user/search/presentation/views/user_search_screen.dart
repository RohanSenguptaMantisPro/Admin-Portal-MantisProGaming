import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/media_res.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_toast.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/bloc/user_search_bloc.dart';

import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/data_table.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/filter_dropdown_tile.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/pagination_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  static const routeName = '/user-search';

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  int currentPage = 1;
  int totalPages = 0;
  int totalResults = 0;
  int resultsPerPage = 10;

  final textEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // for Account Type dropdown overlay. CustomDropdown.
  final OverlayPortalController _accountTypeTooltipController =
      OverlayPortalController();
  final LayerLink _accountTypeLayerLink = LayerLink();

  // for [filter] dropdown overlay.
  final OverlayPortalController _filterToolTipController =
      OverlayPortalController();
  final LayerLink _filterLayerLink = LayerLink();

  void onTapAccountType() {
    setState(() {
      _accountTypeTooltipController.toggle();
    });
  }

  void onTapFilter() {
    setState(() {
      _filterToolTipController.toggle();
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void changePage(int newPageNumber) {
    currentPage = newPageNumber;

    final userToken = context.read<UserTokenProvider>().userToken;
    // Fetch same fields as selected before and stored in provider
    // and put in blocEvent.
    final userSearchParameters =
        context.read<UserSearchParameters>().searchParameters;

    if (userSearchParameters != null) {
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

          showCustomToast(
            context,
            'Could not fetch user details.',
          );
        } else if (state is FetchedUserData) {
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
                              // AccountTypeDropdown(),

                              // CustomDropDown for customDesign and proper
                              // overlaying over other widgets.
                              /*    CustomDropDown(
                            targetAnchor: Alignment.bottomLeft,
                            followerAnchor: Alignment.topLeft,
                            tooltipController: _accountTypeTooltipController,
                            layerLink: _accountTypeLayerLink,
                            overlayMenuWidget: const AccountTypeDropdownMenu(),
                            buttonWidget: ButtonWidget(
                              borderColor: Colors.white.withOpacity(0.3),
                              onTap: onTapAccountType,
                              height: 35,
                              width: 150,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Account Type',
                                          style:
                                              context.theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Colours.whiteIconsColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Search user text field.
                          SearchUserForm(
                            textEditingController: textEditingController,
                            formKey: formKey,
                          ),*/
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
