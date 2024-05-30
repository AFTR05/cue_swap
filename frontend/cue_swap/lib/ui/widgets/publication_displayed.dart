import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class PublicationDisplayed extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final String title;
  final String description;
  final String owner;
  final String product;
  final Function onPressed;

  const PublicationDisplayed({
    super.key, 
    this.imageUrl = "paquete",
    this.width = 200,
    this.height = 200,
    required this.title,
    required this.description, required this.owner, required this.product, required this.onPressed, 
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: imageUrl != "paquete" 
                ? Image.network(
                    imageUrl,
                    height: height * 0.6,
                    fit: BoxFit.cover)
                : Image.asset("publicidad-digital.png",
                  height: height * 0.6,
                    fit: BoxFit.cover
                )
              ,
            ),
          ),
          SizedBox(height: 30,),
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
              style: CustomLabels.imageDisplayedDescription,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Producto: $product',
              textAlign: TextAlign.center,
              style: CustomLabels.imageDisplayedDescription,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Dueño: $owner',
              textAlign: TextAlign.center,
              style: CustomLabels.imageDisplayedDescription,
            ),
          ),
          SizedBox(height: 10)
          ,
          Container(
            constraints: BoxConstraints(maxHeight: 50 ),
            child: CustomOutlinedButton(
              onPressed: onPressed,
              text: "Ofertar",
              
              ),
          ),
        ],
      ),
    );
  }
}
