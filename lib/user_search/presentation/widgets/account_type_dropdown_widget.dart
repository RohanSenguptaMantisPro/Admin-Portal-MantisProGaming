import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// TODO(RohanSengupta): dropdown box design; dropdown selection to change view.

class AccountTypeDropdown extends StatelessWidget {
  List<int> temp = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.white,
      //     ),
      //     ),
      width: 200,
      child: GFMultiSelect(
        initialSelectedItemsIndex: null,
        items: [],
        onSelect: (value) {
          // for (int i = 0; i < value.length; i++) {
          //   log("${value[i]} \n");
          // }

          // onSelect is getting called multiple times so same indices are adding again and again, so
          // emptying and readding new values
          /*temp = [];

          for (var i = 0; i < value.length; i++) {
            temp.add(value[i]);
          }*/
          // value is List<dynamic> but initial selectedIndex is list<int> so we'll be needing list int
          // thats why this extra for loop from value to temp

          // for (var i = 0; i < temp.length; i++) {
          //   log(temp[i].toString());
          // }

          // will be set multiple times, as many times as onSelect gets called
          // value is the list of indices of selected names from the allUsers list.
          // finally all the final indices of names put into another list to access in newProjectFormPage.
        },
        dropdownTitleTileText: 'Account Type',
        dropdownTitleTileTextStyle: context.theme.textTheme.bodyMedium!,

        dropdownTitleTileColor: Colours.greyBackground,
        // dropdownTitleTileMargin: const EdgeInsets.all(
        //   8,
        // ),

        // margins and paddings of the dropdown.
        dropdownTitleTilePadding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 7,
          bottom: 7,
        ),
        dropdownTitleTileMargin: const EdgeInsets.all(0),
        // padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(0),

        // All borders.
        hideDropdownUnderline: true,
        dropdownTitleTileBorder: Border.all(color: Colors.grey, width: 1),
        dropdownTitleTileBorderRadius: BorderRadius.circular(12),

        // icon.
        expandedIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colours.whiteIconsColor,
        ),
        collapsedIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colours.whiteIconsColor,
        ),
        submitButton: Text('OK'),

        type: GFCheckboxType.circle,
        activeBgColor: Colours.primaryColour,
        inactiveBorderColor: Colors.grey,
      ),
    );
  }
}
