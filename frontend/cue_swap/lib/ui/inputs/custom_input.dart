import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CustomInput {

  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(76, 76, 82, 1))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.black ),
      labelStyle: CustomLabels.labelFormStyle,
      hintStyle: CustomLabels.hintFormStyle

    );
  }

  static InputDecoration filterInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(76, 76, 82, 1))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.black ),
      labelStyle: CustomLabels.labelFormStyle,
      hintStyle: CustomLabels.hintFormStyle

    );
  }

  static InputDecoration profileInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
    disabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(76, 76, 82, 1)),
    ),
    enabled: false,
    hintText: hint,
    labelText: label,
    prefixIcon: Icon(icon, color: Colors.black),
    labelStyle: CustomLabels.labelFormStyle.copyWith(color: Colors.black),
    hintStyle: CustomLabels.hintFormStyle.copyWith(color: Color.fromRGBO(76, 76, 82, 1)),

    );
  }

  static InputDecoration signUpInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(76, 76, 82, 1))
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.black ),
      labelStyle: CustomLabels.labelFormStyle,
      hintStyle: CustomLabels.hintFormStyle

    );
  }
  

  static InputDecoration searchInputDecoration({
    required String hint,
    required IconData icon
  }){
    return InputDecoration(
      border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon,color: Colors.grey),
        
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey)
    );
  }

  static InputDecoration formInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }){
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.indigo.withOpacity(0.3))
      ),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon( icon, color: Colors.grey ),
      labelStyle: CustomLabels.labelFormStyle,
      hintStyle: CustomLabels.hintFormStyle
    );
  }


}