import 'dart:convert';
import 'package:cue_swap/models/transaction.dart';

class TransactionsResponse {
  List<Transaction> transactions;

  TransactionsResponse({
        required this.transactions,
    });

  factory TransactionsResponse.fromJson(String str) => TransactionsResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TransactionsResponse.fromMap(Map<String, dynamic> json) => TransactionsResponse(
        transactions: List<Transaction>.from(json["transactions"].map((x) => Transaction.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "transactions": List<dynamic>.from(transactions.map((x) => x.toMap())),
    };
  
}