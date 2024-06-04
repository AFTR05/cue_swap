import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/transactions_response.dart';
import 'package:cue_swap/models/transaction.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  List<Transaction> transactions=[];

  createTransaction(int offerId, AuthProvider authProvider){
    final data={
      "offer_id":offerId
    };
    SwapCUEApi.post("api/transaction/create",data).then(
      (json){
        final transactionResp = Transaction.fromMap(json['transaction']);
        authProvider.isAuthenticated("/dashboard/my_publication/${transactionResp.offer.publication.id}");
        NotificationsService.showSnackbar("Registro exitoso de oferta");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.myPublicationsRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }

  filterByBidder(int bidderId) async {
    final resp = await SwapCUEApi.get('api/transaction/get-by-bidder-id/$bidderId');
    final transactionsResp = TransactionsResponse.fromMap(resp);
    transactions = [...transactionsResp.transactions];
    notifyListeners();
  }

  
  
}