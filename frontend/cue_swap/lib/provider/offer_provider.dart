import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/offer.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class OfferProvider extends ChangeNotifier {

  createOffer(int publicationId, double? monetaryValue, int? exchangedProductId, AuthProvider authProvider){
    final data={
      "publication_id":publicationId,
      "bidder_id": authProvider.user!.id,
      "monetary_value": monetaryValue,
      "exchanged_product_id": exchangedProductId != 0 ? exchangedProductId : null
      
    };
    SwapCUEApi.post("api/offer/create",data).then(
      (json){
        Offer.fromMap(json['offer']);
        authProvider.isAuthenticated(Flurorouter.myOffersRoute);
        NotificationsService.showSnackbar("Registro exitoso de oferta");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.myOffersRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }
  
}