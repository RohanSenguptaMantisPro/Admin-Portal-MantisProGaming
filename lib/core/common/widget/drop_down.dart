import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({
    required this.onChanged,
    required this.initialValue,
    required this.menuItemList,
    this.title,
    super.key,
  });

  final void Function(String) onChanged;
  final String initialValue;
  final List<String> menuItemList;
  final String? title;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  late String _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title ?? ''),
        Container(
          height: 40,
          width: 160,
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colours.greyBackground, // Dark background color
            borderRadius: BorderRadius.circular(10),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: _currentValue,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.white,
                ),
                elevation: 16,
                borderRadius: BorderRadius.circular(10),
                style: context.theme.textTheme.bodyMedium,
                dropdownColor: Colours.greyBackground,
                // Dropdown menu background color
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      _currentValue = newValue;
                    });
                    widget.onChanged(newValue);
                  }
                },

                items: widget.menuItemList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
