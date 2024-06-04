import 'dart:convert';
import 'package:cue_swap/models/offer.dart';

class OffersResponse {
  List<Offer> offers;

    OffersResponse({
        required this.offers,
    });

    factory OffersResponse.fromJson(String str) => OffersResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory OffersResponse.fromMap(Map<String, dynamic> json) => OffersResponse(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "offers": List<dynamic>.from(offers.map((x) => x.toMap())),
    };
  
}