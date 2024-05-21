
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginView extends StatelessWidget {
  const LoginView({super.key});

  
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    
    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(builder: ( context ){

        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);


        return Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints( maxWidth: 370 ),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: loginFormProvider.formkey,
              child: Column(
                children: [
                  
                  // Email
                  TextFormField(
                    onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider), 
                    validator: ( value ) {
                      if( !EmailValidator.validate(value ?? '') ) return 'Email no válido';

                      return null;
                    },
                    onChanged: ( value ) => loginFormProvider.email = value,
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: 'Ingrese su correo',
                      label: 'Email',
                      icon: Icons.email_outlined
                    ),
                  ),

                  SizedBox( height: 20 ),

                  // Password
                  TextFormField(
                    onFieldSubmitted: (_) => onFormSubmit(loginFormProvider, authProvider),
                    onChanged: ( value ) => loginFormProvider.password = value,
                    validator: ( value ) {
                      if ( value == null || value.isEmpty ) return 'Ingrese su contraseña';
                      if ( value.length < 6 ) return 'La contraseña debe de ser de 6 caracteres';

                      return null; // Válido
                    },
                    obscureText: true,
                    style: TextStyle( color: Colors.white ),
                    decoration: CustomInputs.loginInputDecoration(
                      hint: '*********',
                      label: 'Contraseña',
                      icon: Icons.lock_outline_rounded
                    ),
                  ),
                  
                  SizedBox( height: 20 ),
                  CustomOutlinedButton(
                    onPressed: () => onFormSubmit(loginFormProvider, authProvider), 
                    text: 'Ingresar',
                  ),


                  SizedBox( height: 20 ),
                  LinkText(
                    text: 'Nueva cuenta',
                    onPressed: () {
                      Navigator.pushReplacementNamed( context, Flurorouter.registerRoute );
                    },
                  )

                ],
              )
            ),
          ),
        ),
      );
      })
    );
  }

  void onFormSubmit(LoginFormProvider loginFormProvider,AuthProvider authProvider){
    final isValid = loginFormProvider.validateForm();
    if ( isValid )
      authProvider.login(loginFormProvider.email, loginFormProvider.password);
                    
  }

}

class LoginFormProvider {
}