import 'package:admin_portal_mantis_pro_gaming/core/extensions/context_extensions.dart';
import 'package:admin_portal_mantis_pro_gaming/core/res/colours.dart';
import 'package:flutter/material.dart';

class CustomDataTable<T> extends StatelessWidget {
  const CustomDataTable({
    required this.data,
    required this.columns,
    required this.cellBuilder,
    required this.onRowTap,
    super.key,
  });

  final List<T> data;
  final List<DataColumn> columns;
  final List<DataCell> Function(T item) cellBuilder;
  final void Function(T item) onRowTap;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowMinHeight: 60,
      dataRowMaxHeight: 60,
      headingRowColor: WidgetStateProperty.all(Colours.backgroundColorDark),
      dividerThickness: 1,
      showCheckboxColumn: false,
      columns: columns,
      headingRowHeight: 45,
      rows: List<DataRow>.generate(
        data.length,
        (index) => buildDataRow(data[index]),
      ),
    );
  }

  DataRow buildDataRow(T item) {
    return DataRow(
      onSelectChanged: (_) => onRowTap(item),
      cells: cellBuilder(item),
    );
  }
}

// Helper function to create a DataCell with truncated text
DataCell buildDataCell(String text) {
  final displayText = text.length > 10 ? '${text.substring(0, 10)}...' : text;
  return DataCell(
    Tooltip(
      message: text,
      child: Text(displayText, overflow: TextOverflow.ellipsis),
    ),
  );
}
