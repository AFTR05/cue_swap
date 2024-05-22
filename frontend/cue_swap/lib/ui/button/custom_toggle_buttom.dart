
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomToggleButton extends StatelessWidget {

  final Function onPressed;
  final String text;
  final Color colorFilled;
  final Color textColor;
  final double horizontalPadding;
  final double verticalPadding;
  final bool isFilled;
  final bool isEnabled;

  const CustomToggleButton(
    {
      super.key, 
      required this.onPressed, 
      required this.text, 
      required this.isEnabled, 
      this.textColor = const Color.fromRGBO(255, 255, 255, 1), 
      this.colorFilled = const Color.fromRGBO(106, 133, 160, 1), 
      this.isFilled = true, 
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
          SystemMouseCursors.click
        ),
        backgroundColor: MaterialStateProperty.all(
          isEnabled
            ?isFilled
              ?colorFilled.withOpacity(1):Colors.transparent
            :const Color.fromRGBO(95, 99, 109, 1)
        ),
      ),
      onPressed: () => onPressed()
        
      ,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: isEnabled?textColor:Colors.white,
            fontWeight: FontWeight.w400
          )
        ),
      ),
    );
  }
}