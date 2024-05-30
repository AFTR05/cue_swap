import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/user_response.dart';
import 'package:cue_swap/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  getUsers() async {
    final resp = await SwapCUEApi.get('api/user/get-all');
    final usersResp = UsersResponse.fromMap(resp);
    users = [...usersResp.users];
    notifyListeners();
  }
  
}