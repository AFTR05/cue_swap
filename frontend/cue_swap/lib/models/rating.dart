import 'dart:convert';

import 'package:cue_swap/models/transaction.dart';

class Rating {
    String comment;
    int qualification;
    Transaction transaction;

    Rating({
        required this.comment,
        required this.qualification,
        required this.transaction,
    });

    factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        comment: json["comment"],
        qualification: json["qualification"],
        transaction: Transaction.fromMap(json["transaction"]),
    );

    Map<String, dynamic> toMap() => {
        "comment": comment,
        "qualification": qualification,
        "transaction": transaction.toMap(),
    };
}