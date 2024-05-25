import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/login_form_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/inputs/password_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context){
          final loginFormProvider=Provider.of<LoginFormProvider>(context);
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 370),
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formkey,
                    child:  Column(
                      children: [
                      TextFormField( 
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider,context),
                        onChanged: (value){
                          loginFormProvider.email=value;
                          loginFormProvider.updateButtonState();
                        },
                        validator: (value){
                          return Validator.emailValidator(value)
                              ? null
                              : 'Correo electronico no valido';
                        },
                        style: CustomLabels.formStyle,
                        decoration: CustomInput.loginInputDecoration(
                          hint: 'Ingresa tu correo electronico', 
                          label: 'Correo electronico',
                          icon: Icons.email_outlined),
                      ),
                      const SizedBox(height: 20),
                      PasswordInput(
                        onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider,context),
                        onChanged: (value){
                          loginFormProvider.password=value;
                          loginFormProvider.updateButtonState();
                          },
                        hintText: "Ingresa tu contraseña",
                        labelText: "Contraseña",
                      ),
                      const SizedBox(height: 60),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: CustomOutlinedButton(
                          horizontalPadding: 125,
                          verticalPadding: 10,
                          isEnabled: loginFormProvider.isValid,
                          onPressed: () => onFormSubmit(loginFormProvider, authProvider,context), 
                          text: 'Iniciar Sesión'
                        )
                        ),
                        const SizedBox(height: 20),
                        FittedBox(
                          fit: BoxFit.contain,
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '¿Aún no tienes una cuenta? ',
                                  style: CustomLabels.textSpanBasic
                                ),
                                TextSpan(
                                  text: 'crea una acá',
                                  style: CustomLabels.textSpanLink,
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, Flurorouter.signUpRoute);
                                    }
                                )
                              ],
                            )
                          ),
                        ),
                      ]
                      
                    )
                  ),
                ),
              ),
            ),
          );
        }
      ),


    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider,AuthProvider authProvider,BuildContext context){
    final isValid = loginFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
    }
    Navigator.of(context).pop();                 
  }
}