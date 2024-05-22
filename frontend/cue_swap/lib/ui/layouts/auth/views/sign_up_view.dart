import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/login_form_provider.dart';
import 'package:cue_swap/provider/sign_up_form_provider.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/button/simple_toggle_question.dart';
import 'package:cue_swap/ui/inputs/password_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
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
          return Container(
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
                          Flexible(
                            child: TextFormField( 
                              onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider,context),
                              onChanged: (value) {
                                signUpFormProvider.name = value;
                                signUpFormProvider.updateButtonState();
                              },
                              validator: (value) {
                                return Validator.letterValidator(value) && Validator.emptyValidator(value)
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
                          ),
                          SizedBox(width: 80), // Espaciado entre los campos de entrada
                          Flexible(
                            child: TextFormField( 
                              onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider,context),
                              onChanged: (value) {
                                signUpFormProvider.lastname = value;
                                signUpFormProvider.updateButtonState();
                              },
                              validator: (value) {
                                return Validator.letterValidator(value) && Validator.emptyValidator(value)
                                    ? null
                                    : 'Apellido no válido';
                              },
                              style: CustomLabels.formStyle,
                              decoration: CustomInput.loginInputDecoration(
                                hint: 'Ingresa tu apellido', 
                                label: 'Apellido',
                                icon: Icons.account_circle_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40)
                      ,
                      Row(
                        children: [
                          Flexible(
                            child: TextFormField( 
                              onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider,context),
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
                          Flexible(
                            child: TextFormField( 
                              onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider,context),
                              onChanged: (value) {
                                signUpFormProvider.lastname = value;
                                signUpFormProvider.updateButtonState();
                              },
                              validator: (value) {
                                return Validator.nidValidator(value) && Validator.emptyValidator(value)
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
                          Flexible(
                            child: PasswordInput(
                              onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider,context),
                              onChanged: (value){
                                signUpFormProvider.password=value;
                                signUpFormProvider.updateButtonState();
                                },
                              hintText: "Ingresa tu contraseña",
                              labelText: "Contraseña",
                            ),
                          ),
                          SizedBox(width: 80), // Espaciado entre los campos de entrada
                          Flexible(
                            child: PasswordInput(
                              onFieldSubmitted: (_) => onFormSubmit(signUpFormProvider, authProvider,context),
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
                      SizedBox(height: 40),
                      SimpleToggleQuestion(
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
                        rightOption: "Directivo"
                      )
                    ],
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
    }
                    
  }
}