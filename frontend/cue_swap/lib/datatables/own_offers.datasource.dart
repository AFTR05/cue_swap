import 'package:cue_swap/models/offer.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnOffersDTS extends DataTableSource {
  final List<Offer> offers;
  final BuildContext context;

  OwnOffersDTS(List<Offer> offers, this.context) 
      : offers = offers..sort((a, b) => b.offerDate.compareTo(a.offerDate));

  @override
  DataRow? getRow(int index) {
    final offer = offers[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(
            offer.publication.title,
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            offer.bidder.name,
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            offer.offerState,
            style: CustomLabels.tableData
            .copyWith(
              fontSize: 12,
              color: offer.offerState == "ACEPTADO"
                      ? Colors.green
                      : offer.offerState == "EN_ESPERA" 
                        ? Colors.amber
                        : Colors.red
            
            ),
          ),
        ),
        DataCell(
          Text(
            offer.exchangedProduct?.name ?? 'N/A',
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            offer.monetaryValue != null ? offer.monetaryValue.toString() : 'N/A',
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            DateFormat('yyyy-MM-dd').format(offer.offerDate),
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => offers.length;

  @override
  int get selectedRowCount => 0;
}
