import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,

}

class AuthProvider extends ChangeNotifier {

  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password){

    //TODO: Peticion HTTP
    _token = 'dsandaksjdlkasjiwhbvfiwailcbzxlasjdlsa';
    
    // todo localstorage management LocalStorage.prefs.setString('token', _token!);

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    
    //todo navigate with todo NavigationService.replaceTo(Flurorouter.dashboardRoute);

  }

  Future<bool> isAuthenticated() async{
    //todo get token of localstorage final token = LocalStorage.prefs.getString('token');
    String token="";
    if(token == null){
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // TODO: Ir al backend y comprobar si el JWT es valido 
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
  
}