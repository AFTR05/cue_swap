import 'dart:convert';

import 'package:cue_swap/models/complaint.dart';

class ComplaintsResponse {
  List<Complaint> complaints;

    ComplaintsResponse({
        required this.complaints,
    });

    factory ComplaintsResponse.fromJson(String str) => ComplaintsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ComplaintsResponse.fromMapUserResports(Map<String, dynamic> json) => ComplaintsResponse(
        complaints: List<Complaint>.from(json["user_reports"].map((x) => Complaint.fromMap(x))),
    );

    factory ComplaintsResponse.fromMapMadeReports(Map<String, dynamic> json) => ComplaintsResponse(
        complaints: List<Complaint>.from(json["made_reports"].map((x) => Complaint.fromMap(x))),
    );

    factory ComplaintsResponse.fromMap(Map<String, dynamic> json) => ComplaintsResponse(
        complaints: List<Complaint>.from(json["complaints"].map((x) => Complaint.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "complaints": List<dynamic>.from(complaints.map((x) => x.toMap())),
    };
  
}