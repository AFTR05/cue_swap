import 'dart:convert';

import 'package:cue_swap/models/auth_user.dart';

class AuthResponse {
    AuthUser usuario;
    String token;

    AuthResponse({
        required this.usuario,
        required this.token
    });

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: AuthUser.fromMap(json["user"]),
        token: json["authenticationResponseDTO"]["token"]
    );

    Map<String, dynamic> toMap() => {
        "user": usuario.toMap(),
        "token": token
    };
}