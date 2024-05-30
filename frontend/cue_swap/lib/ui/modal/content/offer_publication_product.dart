import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/create_offer_form_provider.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_search_products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OfferPublicationProduct extends StatelessWidget {
  final List<Product> products;
  const OfferPublicationProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final createOfferFormProvider = Provider.of<CreateOfferFormProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
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
                CustomDropdownSearchProducts(
                                    products: filterOutByNid(products, authProvider.user!.nid), 
                                    onChanged: (product){
                                      createOfferFormProvider.productId=product!.id;
                                      createOfferFormProvider.updateButtonState();
                                    }),
                
              ]
            )
          ),
        ),
      );
  }

  List<Product> filterOutByNid(List<Product> products, String nid) {
      return products.where((product) => product.user.nid == nid).toList();
    }
}