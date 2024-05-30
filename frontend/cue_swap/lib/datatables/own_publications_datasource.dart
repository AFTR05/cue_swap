import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnPublicationsDTS extends DataTableSource {
  final List<Publication> publications;
  final BuildContext context;

  OwnPublicationsDTS(this.publications, this.context);
  
  @override
  DataRow? getRow(int index) {
    final publication = publications[index];
    return DataRow.byIndex(
      index: index,
      cells: [
          DataCell(Text(publication.title , style: CustomLabels.tableData.copyWith(fontSize: 10),)),
          DataCell(Text(publication.description , style: CustomLabels.tableData.copyWith(fontSize: 10),)),
          DataCell(Text(publication.state , style: CustomLabels.tableData.copyWith(fontSize: 12),)),
          DataCell(Text(publication.product.name , style: CustomLabels.tableData.copyWith(fontSize: 12),)),
          DataCell(Text(publication.owner.name , style: CustomLabels.tableData.copyWith(fontSize: 10),)),
          DataCell(Text(DateFormat('yyyy-MM-dd').format(publication.date) , style: CustomLabels.tableData.copyWith(fontSize: 12),)),
      ]
    );
  }
  
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => publications.length;

  @override
  int get selectedRowCount => 0;
  
}