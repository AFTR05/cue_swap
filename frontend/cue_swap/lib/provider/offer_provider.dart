import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/offers_response.dart';
import 'package:cue_swap/models/offer.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class OfferProvider extends ChangeNotifier {
  List<Offer> offers = [];

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

  Future cancelOffer(int offerId, AuthProvider authProvider) async{
    final data={
      'offer_id': offerId
    };
      SwapCUEApi.post('api/offer/cancel-offer', data).then(
          (json) {
            final offerResp = Offer.fromMap(json['offer']);
            authProvider.isAuthenticated("/dashboard/my_publication/${offerResp.publication.id}");
            NotificationsService.showSnackbar("Se ha cancelado exitosamente la oferta de ${offerResp.bidder.name}");
            notifyListeners();
          }
        ).catchError((e){
          NavigationService.refresh();
          NotificationsService.showSnackbarError('Ups ocurrido un error');
        });
  }

  getOffers() async {
    final resp = await SwapCUEApi.get('api/offer/get-all');
    final offerResp = OffersResponse.fromMap(resp);
    offers = [...offerResp.offers];
    notifyListeners();
  }
  
}