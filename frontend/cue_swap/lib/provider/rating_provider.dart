import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/ratings_response.dart';
import 'package:cue_swap/models/rating.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class RatingProvider extends ChangeNotifier {
  List<Rating> ratings = [];
  List<Rating> allRatings = [];

  createRating(String comment, int qualification, int transactionId , AuthProvider authProvider){
    final data={
      "comment":comment,
      "qualification": qualification,
      "transaction_id": transactionId
    };
    SwapCUEApi.post("api/rating/create",data).then(
      (json){
        Rating.fromMap(json['rating']);
        authProvider.isAuthenticated(Flurorouter.myTransfersRoute);
        NotificationsService.showSnackbar("Registro exitoso de denuncia");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }

  filterByTransactionId(int transactionId) async {
    final resp = await SwapCUEApi.get('api/rating/get-by-transaction-id/$transactionId');
    final ratingResp = Rating.fromMap(resp['rating']);
    ratings.add(ratingResp);
    notifyListeners();
  }

  getRatings() async {
    final resp = await SwapCUEApi.get('api/rating/get-all');
    final ratingsResp = RatingsResponse.fromMap(resp);
    allRatings = [...ratingsResp.ratings];
    notifyListeners();
  }
  
}