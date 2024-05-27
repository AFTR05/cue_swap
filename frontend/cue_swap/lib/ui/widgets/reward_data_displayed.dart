import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
class RewardDataDisplayed extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final String title;
  final String description;

  const RewardDataDisplayed({super.key, 
    required this.imageUrl,
    this.width = 200,
    this.height = 200,
    required this.title,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.network(
                imageUrl,
                height: height * 0.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  textAlign: TextAlign.center,
                  title,
                  style: CustomLabels.imageDisplayedTitle,
                ),
              ),
            ),
          ),
          SizedBox(height: 10)
          ,
          Align(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              description,
              style: CustomLabels.imageDisplayedDescription,
            ),
          ),
        ],
      ),
    );
  }
}
