import 'package:business_app/core/models/picklist/picklist_lines_model.dart';
import 'package:business_app/core/models/picklist/picklist_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TableDetailView extends StatelessWidget {
  final List<PickListLine> pickListLines;
  final int tableType;
  const TableDetailView(
      {super.key, required this.pickListLines, required this.tableType});

  final headerColumns = const <DataColumn>[
    DataColumn(label: Text('Doc #')),
    DataColumn(label: Text('Card Code')),
    DataColumn(label: Text('Customer Name')),
    DataColumn(label: Text('Doc Date')),
  ];

  final lineColumns = const <DataColumn>[
    DataColumn(label: Text('#')),
    DataColumn(label: Text('Item Code')),
    DataColumn(label: Text('Description')),
  ];

  //creates a list of rows for the table
  List<DataRow> getRows() {
    List<DataRow> rows = [];
    if (tableType == 0) {
      for (var i = 0; i < pickListLines.length; i++) {
        rows.add(DataRow(cells: <DataCell>[
          DataCell(Text(pickListLines[i].orderDocNum.toString())),
          DataCell(Text(pickListLines[i].customerCode)),
          DataCell(Text(pickListLines[i].customerName)),
          DataCell(Text(pickListLines[i].orderDocDate.toString())),
        ]));
      }
    } else {
      for (var i = 0; i <pickListLines.length; i++) {
        rows.add(DataRow(cells: <DataCell>[
          DataCell(Text(pickListLines[i].toString())),
          DataCell(Text(pickListLines[i].itemCode)),
          DataCell(Text(pickListLines[i].itemName)),
        ]));
      }
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    print("Table Type: $tableType");
    return DataTable(
        columns: tableType == 0 ? headerColumns : lineColumns, rows: getRows());
  }
}
