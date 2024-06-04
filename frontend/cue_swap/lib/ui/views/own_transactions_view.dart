import 'package:cue_swap/datatables/own_transactions_datasource.dart';
import 'package:cue_swap/provider/transaction_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class OwnTransactionsView extends StatefulWidget {
  const OwnTransactionsView({super.key});

  @override
  State<OwnTransactionsView> createState() => _OwnTransactionsViewState();
}

class _OwnTransactionsViewState extends State<OwnTransactionsView> {
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

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<TransactionProvider>(context).transactions;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text('Mis transacciones', style: CustomLabels.h1),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: AdCard(
                  width: 550,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '¿Quieres saber acerca de economía circular? ',
                              style: CustomLabels.tableHeader,
                            ),
                            TextSpan(
                              text: ' Accede aquí',
                              style: CustomLabels.textSpanLink.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Flurorouter.institutionalBlogRoute);
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Icon(
                          Icons.eco_outlined,
                          color: Colors.white.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: PaginatedDataTable(
                headingRowColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(106, 133, 160, 1),
                ),
                columns: [
                  DataColumn(label: Text('Transacción', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Producto intercambiado', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Valor', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Publicación', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Fecha', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Estado', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Acciones', style: CustomLabels.tableHeader)),
                ],
                source: OwnTransactionsDTS(transactions, context),
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                header: Text(
                  'Esta es la lista de las transacciones que ha hecho el usuario',
                  maxLines: 2,
                  style: CustomLabels.navbarMessage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
