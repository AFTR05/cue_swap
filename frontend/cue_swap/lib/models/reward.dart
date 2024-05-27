import 'dart:convert';

class Reward {
    int rewardId;
    String description;
    String title;
    int pointsValue;

    Reward({
        required this.rewardId,
        required this.description,
        required this.title,
        required this.pointsValue,
    });

    factory Reward.fromJson(String str) => Reward.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Reward.fromMap(Map<String, dynamic> json) => Reward(
        rewardId: json["id"],
        description: json["description"],
        title: json["title"],
        pointsValue: json["points_value"],
    );

    Map<String, dynamic> toMap() => {
        "id": rewardId,
        "description": description,
        "title": title,
        "points_value": pointsValue,
    };
}