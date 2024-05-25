import 'package:cue_swap/provider/sign_up_form_provider.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_input_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderFormData extends StatelessWidget {
  const LeaderFormData({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpFormProvider = Provider.of<SignUpFormProvider>(context);
        
    return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 352
          ),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [

                const SizedBox(height: 25),
                CustomDropdownInputMenu(
                  onSelectedOptionChanged: (selectedOption) {
                    signUpFormProvider.leaderData!.dependence = selectedOption;
                    signUpFormProvider.updateButtonState();
                  },
                  options: const [
                    'DECANO', 'COORDINADOR', 'PROFESOR'
                    ], 
                  label: 'Dependencia'
                ),
              ]
            )
          ),
        ),
      );
  }
}