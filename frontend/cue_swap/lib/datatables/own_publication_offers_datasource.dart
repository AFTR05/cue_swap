import 'package:cue_swap/models/offer.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/offer_provider.dart';
import 'package:cue_swap/provider/transaction_provider.dart';
import 'package:cue_swap/ui/dialog/confirm_alert_dialog.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OwnPublicationOffersDTS extends DataTableSource {
  final List<Offer> offers;
  final BuildContext context;

  OwnPublicationOffersDTS(this.offers, this.context);
  
  DataRow? getRow(int index) {
    final offerProvider = Provider.of<OfferProvider>(context);
    final transactionProvider = Provider.of<TransactionProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final offer = offers[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(
          Text(
            offer.bidder.name,
            style: CustomLabels.tableData.copyWith(fontSize: 12),
          ),
        ),
        DataCell(
          Text(
            offer.offerState,
            style: CustomLabels.tableData.copyWith(
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
        DataCell(
          Row(
            children: [
              offer.offerState=="EN_ESPERA" 
                ? IconButton(
                    onPressed: (){
                      final dialog=ConfirmAlertDialog(
                        title: '¿Estas seguro de aceptar la oferta?',
                        content: '¿Aceptar definitivamente la oferta?',
                        afirmativeOption: 'Si, Aceptar',
                        onPressed: (){
                          transactionProvider.createTransaction(offer.id,authProvider);
                        }
                      );
                      showDialog(context: context, builder: (_)=>dialog);
                    }, 
                    icon: const Icon(Icons.check_circle_outline, color: Colors.green,)
                  )
                : Container()
                  ,
              offer.offerState=="EN_ESPERA" 
                ? IconButton(
                    onPressed: (){
                      final dialog=ConfirmAlertDialog(
                        title: '¿Estas seguro de borrarlo?',
                        content: '¿Cancelar definitivamente la oferta?',
                        afirmativeOption: 'Si, Cancelar',
                        onPressed: (){
                          offerProvider.cancelOffer(offer.id,authProvider);
                        },
                      );
                      showDialog(context: context, builder: (_)=>dialog);
                    }, 
                    icon: const Icon(Icons.cancel_outlined, color: Colors.red,)
                  )
                : Container()
            ],
          )
        )
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