import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/src/user/search/domain/entities/user_data.dart';
import 'package:flutter/material.dart';

class UserDataTable extends StatelessWidget {
  const UserDataTable({required this.userDetailsData, super.key});

  final List<UserData> userDetailsData;

  @override
  Widget build(BuildContext context) {
    final style = context.theme.textTheme.bodySmall
        ?.copyWith(color: Colours.lightWhiteTextColour);

    return DataTable(
      headingRowColor: WidgetStateProperty.all(Colours.backgroundColorDark),
      dividerThickness: 1,
      showCheckboxColumn: false,
      columns: <DataColumn>[
        DataColumn(label: Text('USERNAME', style: style)),
        DataColumn(label: Text('NAME', style: style)),
        DataColumn(label: Text('EMAIL', style: style)),
        DataColumn(label: Text('ID', style: style)),
      ],
      rows: List<DataRow>.generate(
        userDetailsData.length,
        (index) => _buildDataRow(context, userDetailsData[index]),
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, UserData userData) {
    return DataRow(
      onSelectChanged: (isSelected) {
        if (isSelected != null && isSelected) {}
      },
      cells: [
        DataCell(Text(userData.userName, overflow: TextOverflow.ellipsis)),
        DataCell(Text(userData.name, overflow: TextOverflow.ellipsis)),
        DataCell(Text(userData.email, overflow: TextOverflow.ellipsis)),
        DataCell(Text(userData.id, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
