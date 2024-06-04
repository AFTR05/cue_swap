import 'dart:convert';

import 'package:cue_swap/models/offer.dart';

class Transaction {
    int id;
    Offer offer;
    DateTime transactionDate;
    String transactionState;

    Transaction({
        required this.id,
        required this.offer,
        required this.transactionDate,
        required this.transactionState,
    });

    factory Transaction.fromJson(String str) => Transaction.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Transaction.fromMap(Map<String, dynamic> json) => Transaction(
        offer: Offer.fromMap(json["offer"]),
        transactionDate: DateTime.parse(json["transaction_date"]),
        transactionState: json["transaction_state"],
        id: json["id"]
    );

    Map<String, dynamic> toMap() => {
        "offer": offer.toMap(),
        "transaction_date": "${transactionDate.year.toString().padLeft(4, '0')}-${transactionDate.month.toString().padLeft(2, '0')}-${transactionDate.day.toString().padLeft(2, '0')}",
        "transaction_state":transactionState,
        "id":id
    };
}