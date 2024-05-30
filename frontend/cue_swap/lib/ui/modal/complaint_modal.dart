import 'package:cue_swap/models/user.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/complaint_provider.dart';
import 'package:cue_swap/provider/create_complaint_form_provider.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_search_users.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ComplainModal extends StatelessWidget {
  final List<User> users;
  const ComplainModal({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    final complaintProvider = Provider.of<ComplaintProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => CreateComplaintFormProvider(),
      child: Builder(
        builder: (context) {
          final createComplaintFormProvider=Provider.of<CreateComplaintFormProvider>(context);
          final authProvider=Provider.of<AuthProvider>(context);
          return Container(
            height: 500,
            decoration: buildBoxDecoration(),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: Text('Nueva denuncia',
                          style: CustomLabels.h1
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(), 
                        icon: const Icon(Icons.close, color: Colors.black)
                      )
                    ],
                  ),
                  Divider(color:  Colors.white.withOpacity(0.3)),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Form(
                          autovalidateMode: AutovalidateMode.always,
                          key: createComplaintFormProvider.formkey,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: '',
                                onChanged: (value){
                                  createComplaintFormProvider.description=value;
                                  createComplaintFormProvider.updateButtonState();
                                },
                                decoration: CustomInput.loginInputDecoration(
                                  hint: 'Descripción de la denuncia', 
                                  label: 'Denuncia', 
                                  icon: Icons.new_releases_outlined
                                ),
                                validator: (value){
                                  return Validator.emptyValidator(value)
                                      ? null
                                      : 'Descripción de producto no valido';
                                },
                                style: CustomLabels.formStyle,
                              ),
                              const SizedBox(height: 20,),
                              CustomDropdownSearchUsers(
                                users: filterOutByNid(users, authProvider.user!.nid), 
                                onChanged: (user){
                                  createComplaintFormProvider.userId=user!.id.toString();
                                  createComplaintFormProvider.updateButtonState();
                                }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    child: CustomOutlinedButton(
                      onPressed: () => onFormSubmit(createComplaintFormProvider,complaintProvider, authProvider,context), 
                      text: 'Crear',
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
  
  void onFormSubmit(CreateComplaintFormProvider createComplaintFormProvider,ComplaintProvider complaintProvider, AuthProvider authProvider,BuildContext context){
    final isValid = createComplaintFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      complaintProvider.createComplaint(createComplaintFormProvider.description, authProvider.user!.id, int.parse(createComplaintFormProvider.userId), authProvider);
    }
    Navigator.of(context).pop();           
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black26
      )
    ]
  );

  List<User> filterOutByNid(List<User> users, String nid) {
      return users.where((user) => user.nid != nid).toList();
    }
}