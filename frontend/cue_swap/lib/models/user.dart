import 'dart:convert';

class User {
    int id;
    String nid;
    String name;
    String username;
    String email;
    String password;
    int availablePoints;
    String role;

    User({
        required this.id,
        required this.nid,
        required this.name,
        required this.username,
        required this.email,
        required this.password,
        required this.availablePoints,
        required this.role,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nid: json["nid"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        availablePoints: json["available_points"],
        role: json["role"],  
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nid": nid,
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "available_points": availablePoints,
        "role": role,
    };

    
}