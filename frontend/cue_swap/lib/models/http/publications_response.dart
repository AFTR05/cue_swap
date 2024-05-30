import 'dart:convert';
import 'package:cue_swap/models/publication.dart';

class PublicationsResponse {
  List<Publication> publications;

  PublicationsResponse({
        required this.publications,
    });

  factory PublicationsResponse.fromJson(String str) => PublicationsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PublicationsResponse.fromMap(Map<String, dynamic> json) => PublicationsResponse(
        publications: List<Publication>.from(json["publications"].map((x) => Publication.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "publications": List<dynamic>.from(publications.map((x) => x.toMap())),
    };
  
}