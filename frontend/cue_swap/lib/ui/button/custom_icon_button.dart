import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomIconButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  final IconData icon;

  const CustomIconButton({
    Key? key, 
    required this.onPressed, 
    required this.text, 
    this.color = const Color.fromRGBO(106, 133, 160, 1), 
    this.isFilled = false, 
    required this.icon
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(color),
        overlayColor: MaterialStateProperty.all(color),
        side: MaterialStateProperty.all(BorderSide( color: color))
      ),
      onPressed: () => onPressed(), 
      child: Row(
        children: [
          Icon(icon,color: Colors.white, size: 45,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
            child: Text(
              text,
              style: CustomLabels.customOutlinedButton
            ),
          )
        ]
      )
    );
  }
  
}