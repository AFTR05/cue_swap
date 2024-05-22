
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {

  final Function onPressed;
  final String text;
  final Color colorFilled;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isFilled;
  final bool isEnabled;

  const CustomOutlinedButton(
    {
      super.key, 
      required this.onPressed, 
      required this.text, 
      this.textColor = Colors.white, 
      this.colorFilled = const Color.fromRGBO(106, 133, 160, 1), 
      this.isFilled = true, 
      this.isEnabled = true, 
      this.horizontalPadding = 0, 
      this.verticalPadding = 0
    });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          )
        ),
        side: MaterialStateProperty.all(
          isEnabled
            ? BorderSide( color: colorFilled)
            : const BorderSide( color: Color.fromRGBO(95, 99, 109, 1))       
        ),
        mouseCursor: MaterialStateProperty.all(
          isEnabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic
        ),
        backgroundColor: MaterialStateProperty.all(
          isEnabled
            ?isFilled
              ?colorFilled.withOpacity(1):Colors.transparent
            :const Color.fromRGBO(95, 99, 109, 1)
        ),
      ),
      onPressed: 
      isEnabled
        ? () => onPressed()
        : null
      ,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
        child: Text(
          text,
          style: CustomLabels.customOutlinedButton
        ),
      ),
    );
  }
}