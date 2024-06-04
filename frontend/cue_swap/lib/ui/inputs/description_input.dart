import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class DescriptionInput extends StatelessWidget {
  final String hintText;
  final String label;
  final Function(String) onChanged;
  final IconData icon;
  final int maxLines;
  
  const DescriptionInput({
    super.key, required this.hintText, required this.maxLines, required this.label, required this.icon, required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: CustomInput.loginInputDecoration(
        hint: hintText, 
        label: label, 
        icon: icon
      ),
      onChanged: onChanged,
      validator: (value){
        return !Validator.emptyValidator(value)
          ?  'La descripcion no es valida'
          :   null;
          },
          
      maxLines: maxLines,
    );
  }
}
