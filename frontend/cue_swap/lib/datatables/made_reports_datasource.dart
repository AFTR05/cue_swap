
import 'package:cue_swap/models/complaint.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class MadeReportsDTS extends DataTableSource {
  final List<Complaint> complaints;
  final BuildContext context;

  MadeReportsDTS(this.complaints, this.context);
  
  @override
  DataRow? getRow(int index) {
    final report = complaints[index];
    return DataRow.byIndex(
      index: index,
      cells: [
          DataCell(Text(report.complainant.name , style: CustomLabels.tableData.copyWith(color: Colors.green),)),
          DataCell(Text(report.denounced.name , style: CustomLabels.tableData.copyWith(color: Colors.brown[800]),)),
          DataCell(Text(report.description , style: CustomLabels.tableData,)),
      ]
    );
  }
  
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => complaints.length;

  @override
  int get selectedRowCount => 0;
  
}