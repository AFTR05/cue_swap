import 'dart:convert';

import 'package:cue_swap/models/user.dart';

class UsersResponse {
  List<User> users;

  UsersResponse({
        required this.users,
    });

  factory UsersResponse.fromJson(String str) => UsersResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsersResponse.fromMap(Map<String, dynamic> json) => UsersResponse(
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "users": List<dynamic>.from(users.map((x) => x.toMap())),
    };
  
}