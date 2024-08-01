import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_data_table.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/details/presentation/views/user_details_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/presentation/views/user_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserDataTable extends StatelessWidget {
  const UserDataTable({required this.userDetailsData, super.key});

  final List<UserData> userDetailsData;

  @override
  Widget build(BuildContext context) {
    final style = context.theme.textTheme.bodySmall
        ?.copyWith(color: Colours.lightWhiteTextColour);

    return CustomDataTable<UserData>(
      data: userDetailsData,
      columns: [
        DataColumn(label: Text('USERNAME', style: style)),
        DataColumn(label: Text('NAME', style: style)),
        DataColumn(label: Text('EMAIL', style: style)),
        DataColumn(label: Text('ID', style: style)),
      ],
      cellBuilder: (userData) => [
        buildDataCell(userData.userName),
        buildDataCell(userData.name),
        buildDataCell(userData.email),
        buildDataCell(userData.id),
      ],
      onRowTap: (userData) {
        context.push(
          '${UserSearchScreen.routeName}/${UserDetailsScreen.routeName}/${userData.id}',
        );
      },
    );
  }
}
