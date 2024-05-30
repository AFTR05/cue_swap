import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/create_publication_form_provider.dart';
import 'package:cue_swap/provider/publication_provider.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_search_products.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePublicationModal extends StatelessWidget {
  final List<Product> products;
  const CreatePublicationModal({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final publicationProvider = Provider.of<PublicationProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => CreatePublicationFormProvider(),
      child: Builder(
        builder: (context) {
          final createPublicationFormProvider=Provider.of<CreatePublicationFormProvider>(context);
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
                        child: Text('Nueva publicacion',
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
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 400),
                          child: Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Form(
                              autovalidateMode: AutovalidateMode.always,
                              key: createPublicationFormProvider.formkey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    initialValue: '',
                                    onChanged: (value){
                                      createPublicationFormProvider.title=value;
                                      createPublicationFormProvider.updateButtonState();
                                    },
                                    decoration: CustomInput.loginInputDecoration(
                                      hint: 'Nombre de la publicacion', 
                                      label: 'Nombre de la publicacion', 
                                      icon: Icons.info_outline
                                    ),
                                    validator: (value){
                                      return Validator.emptyValidator(value)
                                          ? null
                                          : 'Nombre de la publicacion no valido';
                                    },
                                    style: CustomLabels.formStyle,
                                  ),
                                  const SizedBox(height: 20,),
                                  TextFormField(
                                    initialValue: '',
                                    onChanged: (value){
                                      createPublicationFormProvider.description=value;
                                      createPublicationFormProvider.updateButtonState();
                                    },
                                    decoration: CustomInput.loginInputDecoration(
                                      hint: 'Descripción de la publicacion', 
                                      label: 'Descripción de la publicacion', 
                                      icon: Icons.info_outline
                                    ),
                                    validator: (value){
                                      return Validator.emptyValidator(value)
                                          ? null
                                          : 'Descripción de la publicacion no valido';
                                    },
                                    style: CustomLabels.formStyle,
                                  ),
                                  const SizedBox(height: 20,),
                                  CustomDropdownSearchProducts(
                                    products: filterOutByNid(products, authProvider.user!.nid), 
                                    onChanged: (product){
                                      createPublicationFormProvider.productId=product!.id.toString();
                                      createPublicationFormProvider.updateButtonState();
                                    }),
                                    CustomOutlinedButton(
                                      onPressed: () => onFormSubmit(createPublicationFormProvider,publicationProvider, authProvider,context), 
                                      text: 'Crear',
                                    ),
                                    const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
  
  void onFormSubmit(CreatePublicationFormProvider createPublicationFormProvider,PublicationProvider publicationProvider, AuthProvider authProvider,BuildContext context){
    final isValid = createPublicationFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      publicationProvider.createPublication(createPublicationFormProvider.title,createPublicationFormProvider.description, authProvider, int.parse(createPublicationFormProvider.productId));
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

  List<Product> filterOutByNid(List<Product> products, String nid) {
      return products.where((product) => product.user.nid == nid).toList();
    }
}