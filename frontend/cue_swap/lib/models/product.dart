import 'dart:convert';

import 'package:cue_swap/models/user.dart';

class Product {
    int id;
    String name;
    String image;
    double price;
    User user;
    String description;
    String category;

    Product({
        required this.id,
        required this.name,
        required this.image,
        required this.price,
        required this.user,
        required this.description,
        required this.category,
    });

    factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"]?.toDouble(),
        user: User.fromMap(json["user"]),
        description: json["description"],
        category: json["category"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "user": user.toMap(),
        "description": description,
        "category": category,
    };
}