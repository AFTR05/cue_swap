
import 'dart:convert';

import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/models/user.dart';

class Publication {
    int id;
    Product product;
    User owner;
    String title;
    String description;
    DateTime date;
    String state;

    Publication({
        required this.id,
        required this.product,
        required this.owner,
        required this.title,
        required this.description,
        required this.date,
        required this.state,
    });

    factory Publication.fromJson(String str) => Publication.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Publication.fromMap(Map<String, dynamic> json) => Publication(
        id:json["id"],
        product: Product.fromMap(json["product"]),
        owner: User.fromMap(json["owner"]),
        title: json["title"],
        description: json["description"],
        date: DateTime.parse(json["date"]),
        state: json["state"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "product": product.toMap(),
        "owner": owner.toMap(),
        "title": title,
        "description": description,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "state": state,
    };
}