import 'package:cue_swap/models/transaction.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/transaction_provider.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/views/content/own_transaction_view_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnTransactionView extends StatefulWidget {

  final String id;

  const OwnTransactionView({super.key, required this.id});

  @override
  State<OwnTransactionView> createState() => _OwnTransactionViewState();
}

class _OwnTransactionViewState extends State<OwnTransactionView> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      Provider.of<TransactionProvider>(context, listen: false).filterByBidder(authProvider.user!.id);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final transactions=Provider.of<TransactionProvider>(context).transactions;
    final transaction=transactions.where((transaction) => transaction.id == int.parse(widget.id)).toList();
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Transaction', style: CustomLabels.h1 ),

          const SizedBox( height: 10 ),
          _OwnTransactionViewBody(transaction: transaction[0])

        ],
      ),
    );
  }
}

class _OwnTransactionViewBody extends StatelessWidget {
  final Transaction transaction;

  const _OwnTransactionViewBody({required this.transaction});


  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(250)
      },
    
      children: [
        TableRow(
          children: [
            OwnTransactionViewForm(transaction: transaction),
          ]
        )
      ],
    );
  }
}
