
import 'package:cue_swap/models/rating.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/inputs/disable_star_rating_widget.dart';
import 'package:cue_swap/ui/inputs/simulated_input.dart';
import 'package:flutter/material.dart';

class FeedbackInformation extends StatelessWidget {
  const FeedbackInformation({
    super.key,
    required this.rating,
  });

  final Rating rating;

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
