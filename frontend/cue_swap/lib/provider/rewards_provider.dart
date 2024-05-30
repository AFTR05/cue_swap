import 'package:cue_swap/api/swap_cue_api.dart';
import 'package:cue_swap/models/http/redeem_response.dart';
import 'package:cue_swap/models/http/rewards_response.dart';
import 'package:cue_swap/models/reward.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';

class RewardsProvider extends ChangeNotifier {
  List<Reward> rewards = [];

  getRewards() async {
    final resp = await SwapCUEApi.get('api/reward/get-all');
    final rewardsResp = RewardsResponse.fromMap(resp);
    rewards = [...rewardsResp.rewards];
    notifyListeners();
  }

  Future redeemReward(int userId, int rewardId, AuthProvider authProvider) async{
    final data={
      'reward_id': rewardId,
      'user_id': userId
    };
      SwapCUEApi.post('api/reward/redeem-reward', data).then(
          (json) {
            final redeemResponse = RedeemResponse.fromMap(json['redeem']);
            authProvider.isAuthenticated(Flurorouter.myRewardsRoute);
            NotificationsService.showSnackbar("Se hace canjeado exitosamente la recompensa ${redeemResponse.reward.title}");
            notifyListeners();
          }
        ).catchError((e){
          NavigationService.refresh();
          NotificationsService.showSnackbarError('Ups ocurrido un error');
        });
  }
  
}