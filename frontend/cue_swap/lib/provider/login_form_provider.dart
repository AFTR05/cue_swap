import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  

  String username = '';
  String password = '';

  bool get isValid => (Validator.emptyValidator(username) && Validator.numbersLettersValidator(username)) && 
                      (Validator.emptyValidator(password) && Validator.passwordValidator(password));


  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}