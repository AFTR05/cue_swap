import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StarRatingWidget extends StatefulWidget {
  final double initialRating;
  final void Function(double rating) onRatingUpdate;
  
  const StarRatingWidget({
    Key? key,
    this.initialRating = 1.0,
    required this.onRatingUpdate,
  }) : super(key: key);

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click, // Cambia el cursor del mouse cuando pasa sobre las estrellas
      child: RatingBar.builder(
        initialRating: widget.initialRating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false, // Cambiado a false para permitir solo calificaciones enteras
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: widget.onRatingUpdate,
      ),
    );
  }
}
