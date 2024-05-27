import 'dart:convert';

import 'package:cue_swap/models/auth_user.dart';
import 'package:cue_swap/models/reward.dart';

class RedeemResponse {
    Reward reward;
    AuthUser user;

    RedeemResponse({
        required this.reward,
        required this.user,
    });

    factory RedeemResponse.fromJson(String str) => RedeemResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RedeemResponse.fromMap(Map<String, dynamic> json) => RedeemResponse(
        reward: Reward.fromMap(json["reward"]),
        user: AuthUser.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "reward": reward.toMap(),
        "user": user.toMap(),
    };
}
