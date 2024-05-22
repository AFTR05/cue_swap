
import 'package:cue_swap/services/validator.dart';
import 'package:flutter/material.dart';

class StudentData{
  String career;
  int semester;
  StudentData(this.career,this.semester);
}

class LeaderData{
  String dependence;
  LeaderData(this.dependence);
}


class SignUpFormProvider extends ChangeNotifier{

  GlobalKey<FormState> formkey = GlobalKey<FormState> ();
  

  String name = '';
  String lastname = '';
  String email = '';
  String nid = '';
  String password = '';
  String confirmPassword = '';
  bool? roleOption;
  StudentData? studentData;
  LeaderData? leaderData;

  bool get isValid => (Validator.emptyValidator(name) && Validator.letterValidator(name)) && 
                      (Validator.emptyValidator(lastname) && Validator.letterValidator(lastname)) && 
                      (Validator.emptyValidator(email) && Validator.emailValidator(email)) && 
                      (Validator.emptyValidator(nid) && Validator.nidValidator(nid)) && 
                      (Validator.emptyValidator(confirmPassword) && Validator.passwordValidator(confirmPassword)) && 
                      (Validator.emptyValidator(password) && Validator.passwordValidator(password)) &&
                      (
                          (roleOption != null) &&
                          (
                            (
                              roleOption == true &&
                              (Validator.emptyValidator(studentData!.career)) &&
                              (Validator.semesterValidator(studentData!.semester)))
                            ) ||
                            (
                              roleOption == false &&
                              (Validator.emailValidator(leaderData!.dependence) 
                            )
                          )
                      );
                      


  SignUpFormProvider(){
    studentData = StudentData('', 0);
    leaderData = LeaderData('');
  }

  void updateButtonState() {
    notifyListeners(); 
  }
  bool validateForm(){
    return(formkey.currentState!.validate()) ? true : false;
  }

}