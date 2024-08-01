import 'package:admin_portal_mantis_pro_gaming/core/common/widget/custom_data_table.dart';
import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:admin_portal_mantis_pro_gaming/core/utils/custom_notification.dart';
import 'package:admin_portal_mantis_pro_gaming/src/game/game_details/presentation/views/game_details_screen.dart';
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

    return CustomDataTable<GameData>(
      data: gameDetailsData,
      columns: [
        DataColumn(label: Text('NAME', style: style)),
        DataColumn(label: Text('GAME ID', style: style)),
        DataColumn(label: Text('PACKAGE NAME', style: style)),
        DataColumn(label: Text('TIMES ADDED', style: style)),
        DataColumn(label: Text('TIMES PLAYED', style: style)),
        DataColumn(label: Text('CREATED AT', style: style)),
        DataColumn(label: Text('UPDATED AT', style: style)),
      ],
      cellBuilder: (gameData) => [
        buildDataCell(gameData.name ?? ''),
        buildDataCell(gameData.id ?? ''),
        buildDataCell(gameData.packageName ?? ''),
        buildDataCell(gameData.timesAdded?.toString() ?? '0'),
        buildDataCell(gameData.timesPlayed?.toString() ?? '0'),
        buildDataCell(formatDate(gameData.createdAt)),
        buildDataCell(formatDate(gameData.updatedAt)),
      ],
      onRowTap: (gameData) {
        if (gameData.id != null && gameData.id!.isNotEmpty) {
          context.push(
            '${GameSearchScreen.routeName}/${GameDetailsScreen.routeName}/${gameData.id}',
          );
        } else {
          showErrorNotification(context, 'Sorry! Game ID not available');
        }
      },
    );
  }

  String formatDate(String? dateString) {
    if (dateString == null) return '';
    try {
      return DateFormat('yyyy-MM-dd').format(DateTime.parse(dateString));
    } catch (e) {
      return '';
    }
  }
}
