import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class CreatePublicationFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  

  String description = '';
  String title = '';
  String productId='';

  bool get isValid => (Validator.emptyValidator(description)) && 
                      (Validator.emptyValidator(description)) && 
                      (Validator.emptyValidator(productId) && Validator.numberValidator(productId));

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}