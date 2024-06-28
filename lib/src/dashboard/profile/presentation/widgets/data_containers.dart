import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class DataContainers extends StatelessWidget {
  const DataContainers({
    required this.title,
    required this.height,
    required this.width,
    required this.dataText,
    super.key,
  });

  final double height;
  final double width;
  final String title;
  final String dataText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.theme.textTheme.labelSmall!.copyWith(
            color: Colors.white,
          ),
        ),
        SizedBox(
          // decoration: BoxDecoration(
          //   border: Border.all(
          //     color: Colors.purple,
          //   ),
          // ),
          height: height,
          width: width,
          child: Material(
            color: Colours.backgroundColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Colours.grey),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                dataText,
                style: context.theme.textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
