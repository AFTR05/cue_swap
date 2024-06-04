import 'dart:convert';

import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/models/user.dart';

class Offer {
    int id;
    Publication publication;
    Product? exchangedProduct;
    User bidder;
    int? monetaryValue;
    DateTime offerDate;
    String offerState;

    Offer({
        
        required this.id,
        required this.publication,
        required this.exchangedProduct,
        required this.bidder,
        required this.monetaryValue,
        required this.offerDate,
        required this.offerState,
    });

    factory Offer.fromJson(String str) => Offer.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Offer.fromMap(Map<String, dynamic> json) {
      return Offer(
        id: json["id"],
        publication: Publication.fromMap(json["publication"]),
        exchangedProduct: json["exchanged_product"] != null ? Product.fromMap(json["exchanged_product"]) : null,
        bidder: User.fromMap(json["bidder"]),
        offerState: json["offerState"],
        monetaryValue: json["monetary_value"] != null ? json["monetary_value"] as int : null,
        offerDate: json["offer_date"] != null ? DateTime.parse(json["offer_date"]) : DateTime.now(), // Si el campo offer_date es nulo, establece la fecha actual
      );
    }


    Map<String, dynamic> toMap() => {
        "offerState": offerState,
        "id": id,
        "publication": publication.toMap(),
        "exchanged_product": exchangedProduct,
        "bidder": bidder.toMap(),
        "monetary_value": monetaryValue,
        "offer_date": "${offerDate.year.toString().padLeft(4, '0')}-${offerDate.month.toString().padLeft(2, '0')}-${offerDate.day.toString().padLeft(2, '0')}",
    };
}