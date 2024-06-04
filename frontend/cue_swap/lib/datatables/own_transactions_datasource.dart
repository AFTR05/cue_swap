import 'package:cue_swap/models/transaction.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/feedback_rating_modal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OwnTransactionsDTS extends DataTableSource {
  final List<Transaction> transactions;
  final BuildContext context;

  OwnTransactionsDTS(this.transactions, this.context);
  
  @override
  DataRow? getRow(int index) {
    final transaction = transactions[index];
    return DataRow.byIndex(
      index: index,
      cells: [
          DataCell(Text(transaction.offer.publication.title , style: CustomLabels.tableData.copyWith(fontSize: 12),)),
          DataCell(Text(
            transaction.offer.exchangedProduct?.name ?? 'N/A',
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),),
          DataCell(Text(
            transaction.offer.monetaryValue != null ? transaction.offer.monetaryValue.toString() : 'N/A',

            style: CustomLabels.tableData.copyWith(fontSize: 12),
          )),
          DataCell(Text(transaction.offer.publication.product.name , style: CustomLabels.tableData.copyWith(fontSize: 12),)),
          DataCell(Text(DateFormat('yyyy-MM-dd').format(transaction.transactionDate) , style: CustomLabels.tableData.copyWith(fontSize: 12),)),
          DataCell(
            Text(transaction.transactionState , 
            style: CustomLabels.tableData.copyWith(
              fontSize: 12,
              color: transaction.transactionState == "COMPLETA"
              ? Colors.green
              : Colors.red
            ),)),
          DataCell(
            transaction.transactionState=="COMPLETA"
              ? IconButton(
                  icon: const Icon(Icons.pageview_outlined),
                  onPressed: (){
                    NavigationService.replaceTo("/dashboard/my_transfer/${transaction.id}");
                  }
                )
              : IconButton(
                  icon: const Icon(Icons.feedback_outlined),
                  onPressed: (){
                    showModalBottomSheet(
                      context: context,
                      
                      builder: (_) => FeedbackRatingModal(transaction: transaction),
                    );
                  },
                )
            
        )
      ]
    );
  }
  
  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => transactions.length;

  @override
  int get selectedRowCount => 0;
  
}