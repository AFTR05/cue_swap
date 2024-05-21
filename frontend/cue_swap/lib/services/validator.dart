
import 'package:email_validator/email_validator.dart';

class Validator {
  static final RegExp passwordRegexp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$',
  );
  
  static bool passwordValidator(String? value) {
    return (passwordRegexp.hasMatch(value!)) ? true : false;
  }

  static bool emailValidator(String? value) {
    return (EmailValidator.validate(value ?? '')) ? true : false;
  }

  static bool emptyValidator(String? value) {
    return ((value ?? '').isNotEmpty) ? true : false;
  }
}
