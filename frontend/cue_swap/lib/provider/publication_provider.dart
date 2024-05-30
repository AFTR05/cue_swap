import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/publications_response.dart';
import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PublicationProvider extends ChangeNotifier {
  List<Publication> publications = [];
  getPublications() async {
    final resp = await SwapCUEApi.get('api/publication/get-all');
    final publicationsResp = PublicationsResponse.fromMap(resp);
    publications = [...publicationsResp.publications];
    notifyListeners();
  }

  createPublication(String title, String description, AuthProvider authProvider, int productId){
    final data={
      "title": title,
      "description": description,
      "product_id": productId,
      "state": "DISPONIBLE",
      "date": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      "owner_id": authProvider.user!.id
    };
    SwapCUEApi.post("api/publication/create",data).then(
      (json){
        Publication.fromMap(json['publication']);
        authProvider.isAuthenticated(Flurorouter.myPublicationsRoute);
        NotificationsService.showSnackbar("Registro exitoso de publicacion");
        notifyListeners();
      }
    ).catchError((e){
      NavigationService.replaceTo(Flurorouter.myPublicationsRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }

}