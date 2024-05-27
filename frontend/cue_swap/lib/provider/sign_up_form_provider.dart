
import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class StudentData{
  String career;
  String semester;
  StudentData(this.career,this.semester);
}

class LeaderData{
  String dependence;
  LeaderData(this.dependence);
}


class SignUpFormProvider extends ChangeNotifier{

  final GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  

  String name = '';
  String username = '';
  String email = '';
  String nid = '';
  String password = '';
  String confirmPassword = '';
  bool? roleOption;
  StudentData? studentData;
  LeaderData? leaderData;

  bool get isValid => ((Validator.emptyValidator(name) && Validator.nameValidator(name)) && 
                      (Validator.emptyValidator(username) && Validator.numbersLettersValidator(username)) && 
                      (Validator.emptyValidator(email) && Validator.emailValidator(email)) && 
                      (Validator.emptyValidator(nid) && Validator.numberValidator(nid)) && 
                      (Validator.emptyValidator(confirmPassword) && Validator.passwordValidator(confirmPassword)) && 
                      (Validator.emptyValidator(password) && Validator.passwordValidator(password)) &&
                      password==confirmPassword) &&
                      (
                          (roleOption != null) && (
                          (
                            (
                              roleOption == true &&
                              
                              (Validator.emptyValidator(studentData!.career)) &&
                              (Validator.numberBetween1And12Validator(studentData!.semester)))
                            ) ||
                            (
                              roleOption == false &&
                              (Validator.emptyValidator(leaderData!.dependence) 
                            )
                          )
                          )
                      );
                      


  SignUpFormProvider(){
    studentData = StudentData('', "");
    leaderData = LeaderData('');
  }

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}