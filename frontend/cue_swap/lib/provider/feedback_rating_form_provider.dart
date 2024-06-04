import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class FeedbackRatingFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  
  String comment = '';
  int qualification=1;

  bool get isValid => 
                      (Validator.emptyValidator(comment)) && 
                      (Validator.emptyValidator(qualification.toString()) && Validator.isValidRating(qualification));

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}