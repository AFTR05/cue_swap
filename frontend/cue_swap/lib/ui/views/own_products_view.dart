import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/ui/button/custom_icon_button.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/product_modal.dart';
import 'package:cue_swap/ui/widgets/product_data_displayed.dart';
import 'package:flutter/gestures.dart';
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
                Column(
                  children: [
                    Row(
                      children: [
                        Text('Mis productos', style: CustomLabels.h1),
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: AdCard(
                            width: 550,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text:
                                            '¿Quieres saber acerca de economía circular? ',
                                        style: CustomLabels.tableHeader,
                                      ),
                                      TextSpan(
                                        text: ' Accede aquí',
                                        style: CustomLabels.textSpanLink
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(
                                                context,
                                                Flurorouter
                                                    .institutionalBlogRoute);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(2),
                                  child: Icon(
                                    Icons.eco_outlined,
                                    color: Colors.white.withOpacity(0.7),
                                    size: 50,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 50),
                CustomIconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => ProductModal(),
                      );
                    },
                    text: 'Crear',
                    icon: Icons.add_outlined)
              ],
            ),
            const SizedBox(height: 10),
            products.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width ~/
                          385, // Ajusta 400 al tamaño deseado
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
                  )
                : WhiteCard(
                    child: Text(
                    "Aun no tienes productos",
                    style: CustomLabels.h2,
                  ))
          ],
        ),
      ),
    );
  }
}
