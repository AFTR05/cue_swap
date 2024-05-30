import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class CreateComplaintFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  

  String description = '';
  String userId='';

  bool get isValid => (Validator.emptyValidator(description)) && 
                      (Validator.emptyValidator(userId) && Validator.numberValidator(userId));

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}