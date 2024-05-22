import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {

  final Function(String) onChanged;
  final Function(String)? onFieldSubmitted;  
  final String labelText;
  final String hintText;
  

  const PasswordInput({Key? key, required this.onChanged, this.onFieldSubmitted, required this.labelText, required this.hintText})
      : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: CustomLabels.formStyle,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value){
        return !Validator.passwordValidator(value)
          ?  'La contraseña debe cumplir con los siguientes requisitos:\n* Al menos 8 caracteres\n* Al menos 1 letra mayúscula\n* Al menos 1 letra minúscula\n* Al menos 1 caracter especial'
          :   null;
          },
          
      decoration: InputDecoration(
        border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(76, 76, 82, 1)
        )
      ),
      prefixIcon: const Icon( Icons.lock_outline_rounded, color: Colors.black ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color.fromRGBO(76, 76, 82, 1)
        )
      ),filled: true,
      fillColor: Colors.white,
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          color: Colors.black,
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          onPressed: _toggleObscureText,
        ),
        hintStyle:CustomLabels.hintFormStyle,
        labelStyle:CustomLabels.labelFormStyle
      ),
      obscureText: _obscureText,
      onChanged: widget.onChanged,
    );
  }
}
