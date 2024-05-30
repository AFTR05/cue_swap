import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
class RewardDisplayed extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  final String title;
  final int valor;
  final int userPoints;
  final String description;
  final bool buttonControllerEnable;
  final Function onPressed;

  const RewardDisplayed({
    this.imageUrl="paquete",
    this.width = 200,
    this.height = 200,
    required this.title,
    required this.description, required this.valor, required this.buttonControllerEnable, required this.userPoints, required this.onPressed,
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
              child: imageUrl != "paquete" 
                ? Image.network(
                    imageUrl,
                    height: height * 0.6,
                    fit: BoxFit.cover)
                : Image.asset("reward.png",
                  height: height * 0.6,
                    fit: BoxFit.cover
                )
              ,
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
          Align(
            alignment: Alignment.center,
            child: Text(
              "${userPoints.toString()} de ${valor.toString()} puntos",
              style: CustomLabels.imageDisplayedDescription,
            ),
          ),
          SizedBox(height: 10)
          ,
          Container(
            constraints: BoxConstraints(maxHeight: 50 ),
            child: CustomOutlinedButton(
              onPressed: onPressed,
              text: "Canjear",
              isEnabled: buttonControllerEnable,
              
              ),
          ),
        ],
      ),
    );
  }
}
