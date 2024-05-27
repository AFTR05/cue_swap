import 'package:cue_swap/provider/sign_up_form_provider.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_input_menu.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StudentFormData extends StatelessWidget {
  const StudentFormData({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpFormProvider = Provider.of<SignUpFormProvider>(context);
        
    return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 352
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [

                const SizedBox(height: 25),
                CustomDropdownInputMenu(
                  onSelectedOptionChanged: (selectedOption) {
                    signUpFormProvider.studentData!.career = selectedOption;
                    signUpFormProvider.updateButtonState();
                  },
                  options: const [
                    "INGENIERIA_DE_SOFTWARE",
                    "INGENIERIA_INDUSTRIAL",
                    "INGENIERIA_CIVIL",
                    "ADMINISTRACION_DE_EMPRESAS",
                    "MEDICINA",
                    "ENFERMERIA",
                    "PSICOLOGIA",
                    "MEDICINA_VERTERINARIA",
                    "MARKETING_DIGITAL"
                    ], 
                  label: 'Carrera'
                ),
                const SizedBox(height: 25),
                TextFormField(
                      onChanged: (value){
                        signUpFormProvider.studentData!.semester=value;
                        signUpFormProvider.updateButtonState();
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value){
                        return Validator.numberBetween1And12Validator(value)
                            ? null
                            : 'Semestre no valido';
                      },
                      style: CustomLabels.formStyle,
                      decoration: CustomInput.loginInputDecoration(
                        hint: 'Ingresa su semestre', 
                        label: 'Semestre',
                        icon: Icons.info_outline,),
                ),
              ]
            )
          ),
        ),
      );
  }
}