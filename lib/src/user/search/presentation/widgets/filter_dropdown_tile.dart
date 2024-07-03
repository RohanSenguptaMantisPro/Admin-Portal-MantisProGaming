import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/i_field.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/account_status_dropdown_tile.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/widgets/search_by_dropdown_tile.dart';
import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  FilterDropdown({super.key});

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  // TODO: optimise. toggle dropdown repeatation of code.
  final textEditingController = TextEditingController();
  String searchByOption = '';
  String accountStatusOption = '';

  final OverlayPortalController _searchByToolTipController =
      OverlayPortalController();
  final LayerLink _searchByLayerLink = LayerLink();

  final OverlayPortalController _accountStatusTooltipController =
      OverlayPortalController();
  final LayerLink _accountStatusLayerLink = LayerLink();

  IconData dropDownIcon = Icons.keyboard_arrow_down;

  bool searchByDropDownButton = false;
  bool accountStatusDropDownButton = false;

  final formKey = GlobalKey<FormState>();

  void searchBy(String option) {
    searchByOption = option.toLowerCase();
    searchByMenu();
  }

  void accountStatus(String option) {
    accountStatusOption = option.toLowerCase();
    accountStatusMenu();
  }

  void searchByMenu() {
    _searchByToolTipController.toggle();
    setState(() {
      searchByDropDownButton = !searchByDropDownButton;
    });
  }

  void accountStatusMenu() {
    _accountStatusTooltipController.toggle();
    setState(() {
      accountStatusDropDownButton = !accountStatusDropDownButton;
    });
  }

  void resetFields() {
    setState(() {
      searchByOption = '';
      accountStatusOption = '';
      textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        child: LayoutBuilder(
          builder: (ctx, boxConstraints) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  //searchBy dropdown
                  const Text('Search By'),
                  CustomDropDown(
                    targetAnchor: Alignment.bottomRight,
                    followerAnchor: Alignment.topRight,
                    tooltipController: _searchByToolTipController,
                    layerLink: _searchByLayerLink,
                    overlayMenuWidget: SearchByDropdownTile(
                      width: boxConstraints.maxWidth,
                      onTap: searchBy,
                    ),
                    buttonWidget: ButtonWidget(
                      borderColor: Colors.white.withOpacity(0.3),
                      onTap: searchByMenu,
                      height: 35,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                searchByOption.isEmpty
                                    ? 'Search By'
                                    : searchByOption,
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                searchByDropDownButton
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colours.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //account Status dropdown.

                  const SizedBox(
                    height: 20,
                  ),

                  const Text('Account Status'),
                  CustomDropDown(
                    targetAnchor: Alignment.bottomRight,
                    followerAnchor: Alignment.topRight,
                    tooltipController: _accountStatusTooltipController,
                    layerLink: _accountStatusLayerLink,
                    overlayMenuWidget: AccountStatusDropDownTile(
                      onTap: accountStatus,
                      width: boxConstraints.maxWidth,
                    ),
                    buttonWidget: ButtonWidget(
                      borderColor: Colors.white.withOpacity(0.3),
                      onTap: accountStatusMenu,
                      height: 35,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 13, right: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                accountStatusOption.isEmpty
                                    ? 'Unrestricted'
                                    : accountStatusOption,
                                style: context.theme.textTheme.bodySmall,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                accountStatusDropDownButton
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: Colours.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //account Status dropdown.
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
                        controller: textEditingController,
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
                        onTap: () => (),
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
            );
          },
        ),
      ),
    );
  }
}
