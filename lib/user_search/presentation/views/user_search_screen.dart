import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_dropdown.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/common/widget/button_widget.dart';
import 'package:admin_portal_mantis_pro_gaming/user_search/presentation/widgets/account_type_dropdown_menu.dart';
import 'package:admin_portal_mantis_pro_gaming/user_search/presentation/widgets/filter_dropdown_tile.dart';
import 'package:admin_portal_mantis_pro_gaming/user_search/presentation/widgets/search_user_form.dart';

import 'package:flutter/material.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
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
    _accountTypeTooltipController.toggle();
  }

  void onTapFilter() {
    _filterToolTipController.toggle();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colours.primaryColour,
              ),
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

                          // CustomDropDown for customDesign and proper overlaying
                          // over other widgets.
                          CustomDropDown(
                            targetAnchor: Alignment.bottomLeft,
                            followerAnchor: Alignment.topLeft,
                            tooltipController: _accountTypeTooltipController,
                            layerLink: _accountTypeLayerLink,
                            overlayMenuWidget: const AccountTypeDropdownMenu(),
                            buttonWidget: ButtonWidget(
                              onTap: onTapAccountType,
                              height: 35,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Account Type',
                                    style: context.theme.textTheme.bodySmall,
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colours.whiteIconsColor,
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(width: 8),

                          // Search user text field.
                          SearchUserForm(
                            textEditingController: textEditingController,
                            formKey: formKey,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // sort button
                          ButtonWidget(
                            height: 35,
                            width: 67,
                            onTap: () => (),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.sort,
                                  color: Colours.whiteIconsColor,
                                  size: 18,
                                ),
                                Text(
                                  'Sort',
                                  style: context.theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          // filter dropdown.
                          CustomDropDown(
                            targetAnchor: Alignment.bottomRight,
                            followerAnchor: Alignment.topRight,
                            tooltipController: _filterToolTipController,
                            layerLink: _filterLayerLink,
                            overlayMenuWidget: FilterDropdown(),
                            buttonWidget: ButtonWidget(
                              onTap: onTapFilter,
                              height: 35,
                              width: 75,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.filter_alt_outlined,
                                    size: 18,
                                    color: Colours.whiteIconsColor,
                                  ),
                                  Text(
                                    'Filter',
                                    style: context.theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.yellow,
              ),
            ),
            child: Row(),
          ),
        ),
        Expanded(
          flex: 12,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,
              ),
            ),
            child: Column(),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: Row(),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
