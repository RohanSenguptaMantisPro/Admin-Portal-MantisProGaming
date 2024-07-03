import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class AccountStatusDropDownTile extends StatelessWidget {
  AccountStatusDropDownTile({
    required this.onTap,
    required this.width,
    super.key,
  });

  void Function(String option) onTap;
  double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        width: width,
        decoration: ShapeDecoration(
          color: Colours.greyBackground,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colours.grey,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => onTap('Unrestricted'),
                child: const Text('Unrestricted'),
              ),
              Divider(),
              InkWell(
                onTap: () => onTap('Restricted'),
                child: const Text('Restricted'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
