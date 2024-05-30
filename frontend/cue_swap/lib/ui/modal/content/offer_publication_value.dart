import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/provider/create_offer_form_provider.dart';
import 'package:cue_swap/services/validator.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class OfferPublicationValue extends StatelessWidget {
  const OfferPublicationValue({super.key});

  @override
  Widget build(BuildContext context) {
    final createOfferFormProvider = Provider.of<CreateOfferFormProvider>(context);
    return Center(
        child: Column(
          children: [
            const SizedBox(height: 25),
            TextFormField(
                                      initialValue: '',
                                      onChanged: (value) {
                                        createOfferFormProvider.monetaryValue = double.parse(value);
                                        createOfferFormProvider.updateButtonState();
                                      },
                                      validator: (value){
                                        return Validator.emptyValidator(value)
                                            ? null
                                            : 'Valor de oferta no valido';
                                      },
                                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                                      ],
                                      decoration: CustomInput.loginInputDecoration(
                                        hint: 'Valor de oferta',
                                        label: 'Valor de oferta',
                                        icon: Icons.info_outline,
                                      ),
                                      style: CustomLabels.formStyle,
                                    ),
          ],
        ),
      );
  }

  List<Product> filterOutByNid(List<Product> products, String nid) {
      return products.where((product) => product.user.nid == nid).toList();
    }
}