import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/ui/button/custom_icon_button.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/product_modal.dart';
import 'package:cue_swap/ui/widgets/product_data_displayed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class OwnProductsView extends StatelessWidget {
  const OwnProductsView({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    final products = userProvider.user!.products;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Mis productos', style: CustomLabels.h1),
                SizedBox(width: 50),
                CustomIconButton(
                  onPressed: (){
                    showModalBottomSheet(
                      context: context, 
                      builder: (_) => ProductModal(),
                    );
                  }, 
                  text: 'Crear', 
                  icon: Icons.add_outlined
                )
              ],
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 343, // Ajusta 400 al tamaño deseado
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductDataDisplayed(
                  title: product.name,
                  description: product.description,
                  category: product.category,
                  price: product.price,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
