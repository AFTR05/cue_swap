import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  

  String email = '';
  String password = '';

  bool get isValid => (Validator.emptyValidator(email) && Validator.emailValidator(email)) && 
                      (Validator.emptyValidator(password) && Validator.passwordValidator(password));


  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}