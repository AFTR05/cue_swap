import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/sign_up_form_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/button/double_toggle_question.dart';
import 'package:cue_swap/ui/inputs/password_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/layouts/auth/views/widgets/leader_form_data.dart';
import 'package:cue_swap/ui/layouts/auth/views/widgets/student_form_data.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => SignUpFormProvider(),
      child: Builder(
        builder: (context) {
          final signUpFormProvider = Provider.of<SignUpFormProvider>(context);
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: signUpFormProvider.formkey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField( 
                                onChanged: (value) {
                                  signUpFormProvider.name = value;
                                  signUpFormProvider.updateButtonState();
                                },
                                validator: (value) {
                                  return Validator.nameValidator(value)
                                      ? null
                                      : 'Nombre no válido';
                                },
                                style: CustomLabels.formStyle,
                                decoration: CustomInput.loginInputDecoration(
                                  hint: 'Ingresa tu nombre', 
                                  label: 'Nombre',
                                  icon: Icons.account_circle_outlined,
                                ),
                              ),
                            )
                            ,
                            SizedBox(width: 80), // Espaciado entre los campos de entrada
                            Expanded(
                              child: TextFormField( 
                                onChanged: (value) {
                                  signUpFormProvider.username = value;
                                  signUpFormProvider.updateButtonState();
                                },
                                validator: (value) {
                                  return Validator.numbersLettersValidator(value)
                                    ? null
                                    : 'Nombre de usuario no valido';
                                },
                                style: CustomLabels.formStyle,
                                decoration: CustomInput.loginInputDecoration(
                                  hint: 'Ingresa tu nombre de usuario', 
                                  label: 'Nombre de usuario',
                                  icon: Icons.person_outline),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40)
                        ,
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField( 
                                onChanged: (value) {
                                  signUpFormProvider.email = value;
                                  signUpFormProvider.updateButtonState();
                                },
                                validator: (value) {
                                  return Validator.emailValidator(value) && Validator.emptyValidator(value)
                                      ? null
                                      : 'Correo electronico no válido';
                                },
                                style: CustomLabels.formStyle,
                                decoration: CustomInput.loginInputDecoration(
                                  hint: 'Ingresa tu correo electronico', 
                                  label: 'Correo electronico',
                                  icon: Icons.email_outlined,
                                ),
                              ),
                            ),
                            SizedBox(width: 80), // Espaciado entre los campos de entrada
                            Expanded(
                              child: TextFormField( 
                                onChanged: (value) {
                                  signUpFormProvider.nid = value;
                                  signUpFormProvider.updateButtonState();
                                },
                                validator: (value) {
                                  return Validator.numberValidator(value) && Validator.emptyValidator(value)
                                      ? null
                                      : 'NID no válido';
                                },
                                style: CustomLabels.formStyle,
                                decoration: CustomInput.loginInputDecoration(
                                  hint: 'Ingresa tu NID', 
                                  label: 'NID',
                                  icon: Icons.info_outline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40)
                        ,
                        Row(
                          children: [
                            Expanded(
                              child: PasswordInput(
                                onChanged: (value){
                                  signUpFormProvider.password=value;
                                  signUpFormProvider.updateButtonState();
                                  },
                                hintText: "Ingresa tu contraseña",
                                labelText: "Contraseña",
                              ),
                            ),
                            SizedBox(width: 80), // Espaciado entre los campos de entrada
                            Expanded(
                              child: PasswordInput(
                                onChanged: (value){
                                  signUpFormProvider.confirmPassword=value;
                                  signUpFormProvider.updateButtonState();
                                  },
                                hintText: "Ingresa tu confirmacion de contraseña",
                                labelText: "Confirmacion de contraseña",
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        DoubleToggleQuestion(
                          question: "¿Cual es tu rol?", 
                          yesFunction: (){
                          signUpFormProvider.roleOption=true;
                          signUpFormProvider.updateButtonState();
                          }, 
                          noFunction: (){
                          signUpFormProvider.roleOption=false;
                          signUpFormProvider.updateButtonState();
                          }, 
                          optionController: signUpFormProvider.roleOption, 
                          leftOption: "Estudiante", 
                          rightOption: "Directivo",
                          leftExtendedQuestion: const StudentFormData(),
                          rightExtendedQuestion: const LeaderFormData(),
                        ),SizedBox(height: 40),
                        FittedBox(
                        fit: BoxFit.contain,
                        child: CustomOutlinedButton(
                          horizontalPadding: 125,
                          verticalPadding: 10,
                          isEnabled: signUpFormProvider.isValid,
                          onPressed: () => onFormSubmit(signUpFormProvider, authProvider,context), 
                          text: 'Registrarse'
                        )
                        ),
                        const SizedBox(height: 20),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '¿Ya tienes una cuenta? ',
                                  style: CustomLabels.textSpanBasic
                                ),
                                TextSpan(
                                  text: 'Inicia Sesión',
                                  style: CustomLabels.textSpanLink,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, Flurorouter.loginRoute);
                                    }
                                )
                              ],
                            )
                          ),
                        ),
                        SizedBox(height: 40),
                    
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onFormSubmit(SignUpFormProvider signUpFormProvider,AuthProvider authProvider,BuildContext context){
    final isValid = signUpFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      if (signUpFormProvider.roleOption!) {
        authProvider.registerStudent(
          signUpFormProvider.name, 
          signUpFormProvider.nid, 
          signUpFormProvider.username, 
          signUpFormProvider.email, 
          signUpFormProvider.password, 
          "STUDENT",
          int.parse(signUpFormProvider.studentData!.semester),
          signUpFormProvider.studentData!.career
        );
      } else {
        authProvider.registerLeader(
          signUpFormProvider.name, 
          signUpFormProvider.nid, 
          signUpFormProvider.username, 
          signUpFormProvider.email, 
          signUpFormProvider.password,
          "LEADER", 
          signUpFormProvider.leaderData!.dependence
        );
      }
    }
    Navigator.of(context).pop();                 
  }
}