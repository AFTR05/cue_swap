import 'dart:convert';

import 'package:cue_swap/models/rating.dart';

class RatingsResponse {
    List<Rating> ratings;

    RatingsResponse({
        required this.ratings,
    });

    factory RatingsResponse.fromJson(String str) => RatingsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory RatingsResponse.fromMap(Map<String, dynamic> json) => RatingsResponse(
        ratings: List<Rating>.from(json["ratings"].map((x) => Rating.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "ratings": List<dynamic>.from(ratings.map((x) => x.toMap())),
    };
}