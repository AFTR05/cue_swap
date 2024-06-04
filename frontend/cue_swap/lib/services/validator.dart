
import 'package:email_validator/email_validator.dart';

class Validator {
  static bool numbersLettersValidator(String? value) {
  return (RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value ?? '')) 
    ? true : false; 
  }

  static bool nameValidator(String? value) {
    value ?? '';
    if (value!.isEmpty) {
      return false;
    }
    final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
    return nameRegex.hasMatch(value);
  }

  static bool isValidRating(int rating) {
    return rating >= 1 && rating <= 5;
  }


  static final RegExp passwordRegexp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$',
  );

  static final RegExp alphabetic = RegExp(r'^[a-zA-Z ]+$');
  
  static bool passwordValidator(String? value) {
    return (passwordRegexp.hasMatch(value!)) ? true : false;
  }

  static bool emailValidator(String? value) {
    return (EmailValidator.validate(value ?? '')) ? true : false;
  }

  static bool semesterValidator(int? value) {
    return value != null && value > 0;
  }


  static bool emptyValidator(String? value) {
    return ((value ?? '').isNotEmpty) ? true : false;
    
  }

  static bool isDoubleGreaterThanZero(double? value) {
    return value! > 0;
  }

  static bool numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }

    final numericRegex = RegExp(r'^\d{1,15}$');
    return numericRegex.hasMatch(value);
  }

  static bool numberBetween1And12Validator(String? value) {
    if (value == null || value.isEmpty) {
      return false;
    }
    final n = int.tryParse(value);
    return n != null && n >= 1 && n <= 12;
  }

  static bool letterValidator(String? value) {
    final count = value?.split(" ").length;
    return (alphabetic.hasMatch(value ?? '') && count! <=2 ) ? true : false;
  }
}

 //El campo no puede estar vacío

  
