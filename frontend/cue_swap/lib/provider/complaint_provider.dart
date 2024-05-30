import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/complaint.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class ComplaintProvider extends ChangeNotifier {
  createComplaint(String description, int complaintId, int denouncedId , AuthProvider authProvider){
    final data={
      "description": description,
      "complainant_id":	complaintId,
      "denounced_id": denouncedId
    };
    SwapCUEApi.post("api/complaint/create",data).then(
      (json){
        Complaint.fromMap(json['complaint']);
        authProvider.isAuthenticated(Flurorouter.complaintsRoute);
        NotificationsService.showSnackbar("Registro exitoso de denuncia");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }
  
}