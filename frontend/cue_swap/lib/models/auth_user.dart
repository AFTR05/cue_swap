import 'dart:convert';

import 'package:cue_swap/models/complaint.dart';
import 'package:cue_swap/models/offer.dart';
import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/models/reward.dart';
import 'package:cue_swap/models/transaction.dart';
class AuthUser {
    int id;
    String nid;
    String name;
    String username;
    String email;
    String password;
    int availablePoints;
    List<Reward>? rewards;
    List<Complaint>? userReports;
    List<Complaint>? madeReports;
    List<Product> products;
    List<Publication>? publications;
    List<Offer>? offers;
    List<Transaction>? transactions;
    String role;
    bool dataState;

    AuthUser({
        required this.id,
        required this.nid,
        required this.name,
        required this.username,
        required this.email,
        required this.password,
        required this.availablePoints,
        required this.rewards,
        required this.userReports,
        required this.madeReports,
        required this.products,
        required this.publications,
        required this.transactions,
        required this.offers,
        required this.dataState,
        required this.role,
    });

    factory AuthUser.fromJson(String str) => AuthUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthUser.fromMap(Map<String, dynamic> json) => AuthUser(
        dataState: json['data_state'],
        id: json["id"],
        nid: json["nid"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        availablePoints: json["available_points"],
        rewards: json["rewards"] != null ? List<Reward>.from(json["rewards"].map((x) => Reward.fromMap(x))) : <Reward>[],
        userReports: json["user_reports"]!= null ? List<Complaint>.from(json["user_reports"].map((x) => Complaint.fromMap(x))):<Complaint>[],
        role: json["role"],  
        madeReports: json["made_reports"] != null ? List<Complaint>.from(json["made_reports"].map((x) => Complaint.fromMap(x))):<Complaint>[],
        products: List<Product>.from(json["products"].map((x)=> Product.fromMap(x))),
        offers: json["offers"] != null ? List<Offer>.from(json["offers"].map((x)=> Offer.fromMap(x))):[],
        transactions: json["transactions"] != null ? List<Transaction>.from(json["transactions"].map((x)=> Transaction.fromMap(x))):<Transaction>[],
        publications: json["publications"] != null ? List<Publication>.from(json["publications"].map((x)=> Publication.fromMap(x))):<Publication>[]
    );

    Map<String, dynamic> toMap() => {
        "data_state" : dataState,
        "id": id,
        "nid": nid,
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "available_points": availablePoints,
        "rewards": rewards,
        "user_reports": userReports,
        "made_reports": madeReports,
        "products": List<Product>.from(products.map((x)=> x.toMap())),
        "publications": publications,
        "transactions": transactions,
        "offers": offers,
        "role": role,
    };
}