import 'dart:convert';

import 'package:cue_swap/models/product.dart';

class ProductsResponse {
  List<Product> products;

  ProductsResponse({
        required this.products,
    });

  factory ProductsResponse.fromJson(String str) => ProductsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductsResponse.fromMap(Map<String, dynamic> json) => ProductsResponse(
        products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
    };
  
}