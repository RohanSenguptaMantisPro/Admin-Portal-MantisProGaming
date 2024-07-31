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

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                dataRowMinHeight: 63,
                dataRowMaxHeight: 63,
                headingRowColor:
                    WidgetStateProperty.all(Colours.backgroundColorDark),
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
              ),
            ),
          ),
        );
      },
    );
  }

  DataRow _buildDataRow(BuildContext context, UserData userData) {
    return DataRow(
      onSelectChanged: (isSelected) {
        if (isSelected != null && isSelected) {
          //redirect to userDetails page with the ID of that user.
          context.push(
            '${UserSearchScreen.routeName}/${UserDetailsScreen.routeName}/${userData.id}',
          );
        }
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
