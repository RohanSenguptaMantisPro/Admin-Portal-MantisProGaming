import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/game_details_screen.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/domain/entities/game_data.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_search/presentation/views/game_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class GameDataTable extends StatelessWidget {
  const GameDataTable({required this.gameDetailsData, super.key});

  final List<GameData> gameDetailsData;

  @override
  Widget build(BuildContext context) {
    final style = context.theme.textTheme.bodySmall
        ?.copyWith(color: Colours.lightWhiteTextColour);

    return DataTable(
      dataRowMinHeight: 63,
      dataRowMaxHeight: 63,
      headingRowColor: WidgetStateProperty.all(Colours.backgroundColorDark),
      dividerThickness: 1,
      showCheckboxColumn: false,
      columns: <DataColumn>[
        DataColumn(label: Text('NAME', style: style)),
        DataColumn(label: Text('GAME ID', style: style)),
        DataColumn(label: Text('PACKAGE NAME', style: style)),
        DataColumn(label: Text('TIMES ADDED', style: style)),
        DataColumn(label: Text('TIMES PLAYED', style: style)),
        DataColumn(label: Text('CREATED AT', style: style)),
        DataColumn(label: Text('UPDATED AT', style: style)),
      ],
      rows: List<DataRow>.generate(
        gameDetailsData.length,
        (index) => _buildDataRow(context, gameDetailsData[index]),
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, GameData gameData) {
    final dateFormat = DateFormat('yyyy-MM-dd');

    return DataRow(
      onSelectChanged: (isSelected) {
        if (isSelected != null && isSelected) {
          if (gameData.id == null || gameData.id!.isEmpty) {
            showErrorNotification(context, 'Sorry! Game ID not available');
          } else {
            context.push(
              '${GameSearchScreen.routeName}/${GameDetailsScreen.routeName}/${gameData.id}',
            );
          }
        }
      },
      cells: [
        DataCell(Text(gameData.name ?? '', overflow: TextOverflow.ellipsis)),
        DataCell(Text(gameData.id ?? '', overflow: TextOverflow.ellipsis)),
        DataCell(
            Text(gameData.packageName ?? '', overflow: TextOverflow.ellipsis)),
        DataCell(Text(gameData.timesAdded.toString(),
            overflow: TextOverflow.ellipsis)),
        DataCell(Text(gameData.timesPlayed.toString(),
            overflow: TextOverflow.ellipsis)),
        DataCell(Text(
            gameData.createdAt == null
                ? ''
                : dateFormat.format(DateTime.parse(gameData.createdAt!)),
            overflow: TextOverflow.ellipsis)),
        DataCell(Text(
            gameData.updatedAt == null
                ? ''
                : dateFormat.format(DateTime.parse(gameData.updatedAt!)),
            overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
