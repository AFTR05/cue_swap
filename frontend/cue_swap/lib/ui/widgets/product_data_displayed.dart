import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class ProductDataDisplayed extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final String title;
  final String description;
  final String category;
  final double price;

  const ProductDataDisplayed({
    super.key, 
    this.imageUrl = "paquete",
    this.width = 200,
    this.height = 200,
    required this.title,
    required this.description, 
    required this.category, 
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: imageUrl != "paquete" 
                ? Image.network(
                    imageUrl,
                    height: height * 0.6,
                    fit: BoxFit.cover)
                : Image.asset("caja-del-paquete.png",
                  height: height * 0.6,
                    fit: BoxFit.cover
                )
              ,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: CustomLabels.imageDisplayedTitle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: CustomLabels.imageDisplayedDescription.copyWith(fontSize: 10),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Category: $category',
              textAlign: TextAlign.center,
              style: CustomLabels.imageDisplayedDescription,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${price.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: CustomLabels.priceText,
            ),
          ),
        ],
      ),
    );
  }
}
