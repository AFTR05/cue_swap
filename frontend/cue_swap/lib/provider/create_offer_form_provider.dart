import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class CreateOfferFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  
  
  bool? offerOption;
  double monetaryValue = 0.0;
  int productId= 0;

  bool get isValid => 
                      (offerOption != null) && (
                            (
                              offerOption == true &&
                              
                              (Validator.emptyValidator(monetaryValue.toString()) && Validator.isDoubleGreaterThanZero(monetaryValue)) 
                              ||
                            (
                              offerOption == false &&
                              (Validator.emptyValidator(productId.toString()) && Validator.numberValidator(productId.toString()))
                          )
                          ));

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}