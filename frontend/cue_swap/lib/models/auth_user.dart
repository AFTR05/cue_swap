import 'dart:convert';

import 'package:cue_swap/models/complaint.dart';
import 'package:cue_swap/models/reward.dart';
class AuthUser {
    int id;
    String nid;
    String name;
    String username;
    String email;
    String password;
    int availablePoints;
    List<Reward> rewards;
    List<Complaint> userReports;
    List<Complaint> madeReports;
    String role;

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
        required this.role,
    });

    factory AuthUser.fromJson(String str) => AuthUser.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthUser.fromMap(Map<String, dynamic> json) => AuthUser(
        id: json["id"],
        nid: json["nid"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        availablePoints: json["available_points"],
        rewards: List<Reward>.from(json["rewards"].map((x) => Reward.fromMap(x))),
        userReports: List<Complaint>.from(json["user_reports"].map((x) => Complaint.fromMap(x))),
        role: json["role"],  
        madeReports: List<Complaint>.from(json["made_reports"].map((x) => Complaint.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nid": nid,
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "available_points": availablePoints,
        "rewards": List<Reward>.from(rewards.map((x) => x.toMap())),
        "user_reports": List<Complaint>.from(userReports.map((x) => x.toMap())),
        "made_reports": List<Complaint>.from(madeReports.map((x) => x.toMap())),
        "role": role,
    };
}