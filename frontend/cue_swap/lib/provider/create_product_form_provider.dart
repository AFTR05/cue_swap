import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class CreateProductFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  
  String name = '';
  String description = '';
  String category = '';
  String userId='';
  double price=0.0;

  bool get isValid => 
                      (Validator.emptyValidator(name)) && 
                      (Validator.emptyValidator(description)) && 
                      (Validator.emptyValidator(category)) && 
                      (Validator.emptyValidator(userId) && Validator.numberValidator(userId)) &&
                      (Validator.emptyValidator(price.toString()) && Validator.isDoubleGreaterThanZero(price));

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}