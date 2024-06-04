import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/auth_user.dart';
import 'package:cue_swap/models/http/auth_response.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/local_storage.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,

}

class AuthProvider extends ChangeNotifier {

  AuthUser? user;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated(Flurorouter.dashboardRoute);
  }

  login(String username, String password){
    final data={
            "username": username,
            "password": password
        };
        SwapCUEApi.post('api/user/authenticate',data).then(
          (json) {
            final authResponse = AuthResponse.fromMap(json['user_data']);
            user = authResponse.usuario;
            if (user!.dataState==false){
              NavigationService.replaceTo(Flurorouter.loginRoute);
              NotificationsService.showSnackbarError('Has sido bloqueado por mala conducta');
            } else{
              authStatus = AuthStatus.authenticated;
              LocalStorage.prefs.setString('token', authResponse.token ); 
              NavigationService.replaceTo(Flurorouter.dashboardRoute);
              notifyListeners();
            }
            
          }
        ).catchError((e){
          NavigationService.replaceTo(Flurorouter.loginRoute);
          NotificationsService.showSnackbarError('Nombre de usuario / Contraseña no validos');
        });

  }

  registerStudent(String name,String nid,String username,String email,
  String password, String role, int semester, String career){
    final data={
      "name": name,    
      "nid": nid,
      "username": username,
      "email": email,
      "password": password,
      "role":role,
      "products": [
      ],
      "semester":semester,
      "career": career
    };
    SwapCUEApi.post("api/student/create",data).then(
      (json){
        AuthUser.fromMap(json['user_data']['studentDTO']);
        NavigationService.replaceTo(Flurorouter.loginRoute);
        NotificationsService.showSnackbar("Registro exitoso");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.signUpRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }

  registerLeader(String name,String nid,String username,String email,
  String password, String role, String dependence){
    
    final data={
            "name": name,
            "username": username,
            "role":role,
            "email": email,
            "password": password,
            "nid": nid,
            "products": [
            ],
            "dependence":dependence
    };
    SwapCUEApi.post("api/leader/create",data).then(
      (json){
        AuthUser.fromMap(json['user_data']['leaderDTO']);
        NavigationService.replaceTo(Flurorouter.loginRoute);
        NotificationsService.showSnackbar("Registro exitoso");
        notifyListeners();
      }
    ).catchError((e){
      print('Error en: $e');
      NavigationService.replaceTo(Flurorouter.signUpRoute);
      NotificationsService.showSnackbarError('Datos no validos');
    });
  }

  Future<bool> isAuthenticated(String route) async {
    final token = LocalStorage.prefs.getString('token');

    if( token == null ) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    } 
      SwapCUEApi.get('api/user/auth-by-header').then(
        (json) {
          final authResponse = AuthResponse.fromMap(json['user_data']);
            user = authResponse.usuario;
            authStatus = AuthStatus.authenticated;
            LocalStorage.prefs.setString('token', authResponse.token ); 
            NavigationService.replaceTo(route);
            notifyListeners();
            return true;
        }
      ).catchError((e){
          authStatus = AuthStatus.notAuthenticated;
          NavigationService.replaceTo(Flurorouter.loginRoute);
          NotificationsService.showSnackbarError('Nombre de usuario / Contraseña no validos');
          return false;
        });
      return false;
  }

  logout(){
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();  
  }
  
}