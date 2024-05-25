
import 'package:email_validator/email_validator.dart';

class Validator {
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

  static bool nidValidator(String? cedula) {
  
  RegExp regex = RegExp(r'^\d{2}[.]?\d{3}[.]?\d{3}[.]?$');

  if (!regex.hasMatch(cedula!)) return false;

  List<int> digitos = cedula.replaceAll('.', '').split('').map(int.parse).toList();
  int suma = digitos.fold(0, (acc, digit) => acc + digit);
  int digitoVerificadorCalculado = (suma * 9) % 10;

  return digitoVerificadorCalculado == digitos[9];
}

  static bool emptyValidator(String? value) {
    return ((value ?? '').isNotEmpty) ? true : false;
    
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

  
