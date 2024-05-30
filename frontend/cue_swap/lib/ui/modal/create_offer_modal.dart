import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/create_offer_form_provider.dart';
import 'package:cue_swap/provider/offer_provider.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/button/double_toggle_question.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/content/offer_publication_product.dart';
import 'package:cue_swap/ui/modal/content/offer_publication_value.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateOfferModal extends StatelessWidget {
  final Publication publication;
  final List<Product> products;
  const CreateOfferModal({super.key, required this.publication, required this.products});

  @override
  Widget build(BuildContext context) {
    final offerProvider = Provider.of<OfferProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => CreateOfferFormProvider(),
      child: Builder(
        builder: (context) {
          final createOfferFormProvider=Provider.of<CreateOfferFormProvider>(context);
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
                        child: Text('Nueva oferta',
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
                              key: createOfferFormProvider.formkey,
                              child: Column(
                                children: [
                                  DoubleToggleQuestion(
                                    question: "¿Cual es tu tipo de oferta?", 
                                    yesFunction: (){
                                    createOfferFormProvider.offerOption=true;
                                    createOfferFormProvider.updateButtonState();
                                    }, 
                                    noFunction: (){
                                    createOfferFormProvider.offerOption=false;
                                    createOfferFormProvider.updateButtonState();
                                    }, 
                                    optionController: createOfferFormProvider.offerOption, 
                                    leftOption: "Dinero", 
                                    rightOption: "Producto",
                                    leftExtendedQuestion: const OfferPublicationValue(),
                                    rightExtendedQuestion: OfferPublicationProduct(products: products,),
                                  ),
                                  const SizedBox(height: 10),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: CustomOutlinedButton(
                                      horizontalPadding: 125,
                                      verticalPadding: 10,
                                      isEnabled: createOfferFormProvider.isValid,
                                      onPressed: () => onFormSubmit(createOfferFormProvider, offerProvider, authProvider,context), 
                                      text: 'Ofertar'
                                    )
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
  
  void onFormSubmit(CreateOfferFormProvider createofferFormProvider,OfferProvider offerProvider, AuthProvider authProvider,BuildContext context){
    final isValid = createofferFormProvider.validateForm();
    if ( isValid ) {
      NotificationsService.showBusyIndicator(context);
      offerProvider.createOffer(
        publication.id,
        createofferFormProvider.monetaryValue, 
        createofferFormProvider.productId,
        authProvider
        );
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