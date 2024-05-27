import 'dart:convert';

import 'package:cue_swap/models/reward.dart';

class RewardsResponse {
    List<Reward> rewards;

    RewardsResponse({
        required this.rewards,
    });

    factory RewardsResponse.fromJson(String str) => RewardsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RewardsResponse.fromMap(Map<String, dynamic> json) => RewardsResponse(
        rewards: List<Reward>.from(json["rewards"].map((x) => Reward.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "rewards": List<dynamic>.from(rewards.map((x) => x.toMap())),
    };
}