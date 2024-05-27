import 'dart:convert';


import 'package:cue_swap/models/user.dart';

class Complaint {
    String description;
    User complainant;
    User denounced;

    Complaint({
        required this.description,
        required this.complainant,
        required this.denounced,
    });

    factory Complaint.fromJson(String str) => Complaint.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Complaint.fromMap(Map<String, dynamic> json) => Complaint(
        description: json["description"],
        complainant: User.fromMap(json["complainant"]),
        denounced: User.fromMap(json["denounced"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "complainant": complainant.toMap(),
        "denounced": denounced.toMap(),
    };
}