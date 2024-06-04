import 'package:cue_swap/models/rating.dart';
import 'package:cue_swap/models/transaction.dart';
import 'package:cue_swap/provider/rating_provider.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/inputs/disable_star_rating_widget.dart';
import 'package:cue_swap/ui/inputs/simulated_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OwnTransactionViewForm extends StatefulWidget {
  final Transaction transaction;

  const OwnTransactionViewForm({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<OwnTransactionViewForm> createState() => _OwnTransactionViewFormState();
}

class _OwnTransactionViewFormState extends State<OwnTransactionViewForm> {
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isInitialized) {
      Provider.of<RatingProvider>(context, listen: false)
          .filterByTransactionId(widget.transaction.id);
      _isInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratingProvider = Provider.of<RatingProvider>(context);
    // Verifica si la lista ratings tiene elementos antes de acceder al primer elemento
    final rating = ratingProvider.ratings.isNotEmpty ? ratingProvider.ratings[0] : null;
    return Column(
      children: [
        TransactionInformation(transaction: widget.transaction),
        const SizedBox(height: 20),
        // Si rating es null, puede manejarlo de acuerdo a tus necesidades
        rating != null ? FeedbackInformation(transaction: widget.transaction, rating: rating,) : Container(),
        const SizedBox(height: 10),
      ],
    );
  }
}


class TransactionInformation extends StatelessWidget {
  const TransactionInformation({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Información de transacción',
      child: Column(
        children: [
          SimulatedInput(
            value: transaction.offer.publication.title,
            label: 'Titulo de publicación', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: transaction.transactionState,
            label: 'Estado', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: DateFormat('yyyy-MM-dd').format(transaction.transactionDate),
            label: 'Fecha', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: transaction.offer.bidder.name,
            label: 'Dueño', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: transaction.offer.publication.product.name,
            label: 'Producto', 
            icon: Icons.info_outline_rounded
          ),
        ],
      )
    );
  }
}

class FeedbackInformation extends StatelessWidget {
  const FeedbackInformation({
    super.key,
    required this.rating, required this.transaction,
  });

  final Rating rating;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Información de retroalimentación',
      child: Column(
        children: [
          
          const SizedBox(height: 20,),
          SimulatedInput(
            value: rating.comment,
            label: 'Comentario', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          DisableStarRatingWidget(
            initialRating: rating.qualification.toDouble(),
          )
          
        ],
      )
    );
  }
}
