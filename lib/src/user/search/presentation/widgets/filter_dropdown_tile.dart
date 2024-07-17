import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_search_parameters.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/app/providers/user_token_provider.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/enum/account_status_dropdown_menu.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/enum/search_by_dropdown_menu.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/drop_down.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/usecases/user_search_results.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/bloc/user_search_bloc.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/account_status_dropdown_tile.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/search_by_dropdown_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({required this.closeOnSubmit, super.key});

  final VoidCallback closeOnSubmit;

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  final formKey = GlobalKey<FormState>();
  final queryTextEditingController = TextEditingController();
  String searchByOption = SearchByDropDownMenu.none.value;
  String accountStatusOption = AccountStatusDropDownMenu.unrestricted.value;

  @override
  void initState() {
    super.initState();

    //if already used parameters available then use those.
    final userSearchParameters =
        context.read<UserSearchParameters>().searchParameters;

    if (userSearchParameters != null) {
      searchByOption = userSearchParameters.field;
      accountStatusOption = userSearchParameters.accountStatus;
      queryTextEditingController.text = userSearchParameters.query;
    }
  }

  void resetFields() {
    setState(() {
      searchByOption = SearchByDropDownMenu.none.value;
      accountStatusOption = AccountStatusDropDownMenu.unrestricted.value;
      queryTextEditingController.clear();
    });

    context.read<UserSearchParameters>().searchParameters = null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserSearchParameters>(
      builder: (_, userSearchParameters, __) {
        return Container(
          margin: const EdgeInsets.only(top: 8),
          width: 400,
          height: 330,
          decoration: ShapeDecoration(
            color: Colours.backgroundColourLightDark,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                color: Colours.grey,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),

                  // searchBy dropdown
                  DropDown(
                    dropdownWidth: double.infinity,
                    dropdownHeight: 35,
                    title: 'Search By',
                    // Converting items of SearchByDropDownMenu
                    // enum to DropdownMenuItem<String>
                    // for dropdown options.
                    menuItemList: SearchByDropDownMenu.values
                        .map<DropdownMenuItem<String>>((
                      SearchByDropDownMenu searchByMenu,
                    ) {
                      return DropdownMenuItem<String>(
                        value: searchByMenu.value,
                        child: Text(searchByMenu.value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      searchByOption = newValue;
                    },
                    initialValue: searchByOption,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // account Status dropdown.
                  DropDown(
                    dropdownWidth: double.infinity,
                    dropdownHeight: 35,
                    title: 'Account Status',
                    // Converting items of AccountStatus
                    // enum to DropdownMenuItem<String>
                    // for dropdown options.
                    menuItemList: AccountStatusDropDownMenu.values
                        .map<DropdownMenuItem<String>>((
                      AccountStatusDropDownMenu accountStatus,
                    ) {
                      return DropdownMenuItem<String>(
                        value: accountStatus.value,
                        child: Text(accountStatus.value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      accountStatusOption = newValue;
                    },
                    initialValue: accountStatusOption,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

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

                  const SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        onTap: resetFields,
                        width: 60,
                        height: 35,
                        child: const Center(
                          child: Text('Reset'),
                        ),
                      ),
                      ButtonWidget(
                        //is text field is empty inactive button.
                        // isButtonActive: ,
                        onTap: () {
                          final userToken =
                              context.read<UserTokenProvider>().userToken;

                          //Save search setter parameters in local provider.
                          context
                              .read<UserSearchParameters>()
                              .searchParameters = UserSearchResultsParams(
                            userToken: '',
                            pageNumber: '1',
                            limit: '10',
                            field: searchByOption,
                            query: queryTextEditingController.text,
                            country: 'india',
                            accountStatus: accountStatusOption,
                          );

                          // SearchBy Bloc event.
                          context.read<UserSearchBloc>().add(
                                SearchByEvent(
                                  userToken: userToken ?? '',
                                  pageNumber: '1',
                                  limit: '10',
                                  //  if field.isEmpty then field parameter
                                  // won't be used in server call.
                                  field: searchByOption ==
                                          SearchByDropDownMenu.none.value
                                      ? ''
                                      : searchByOption,
                                  query: queryTextEditingController.text,
                                  country: 'india',
                                  accountStatus: accountStatusOption,
                                ),
                              );

                          //close filter dropdown on submit button pressed.
                          widget.closeOnSubmit();
                        },
                        width: 70,
                        height: 35,
                        buttonBackgroundColor: Colours.primaryColour,
                        child: const Center(
                          child: Text('Search'),
                        ),
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
