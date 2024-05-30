import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/product_provider.dart';
import 'package:cue_swap/provider/publication_provider.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/create_offer_modal.dart';
import 'package:cue_swap/ui/widgets/publication_displayed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    Provider.of<PublicationProvider>(context, listen: false).getPublications();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    
    final productProvider = Provider.of<ProductProvider>(context);
    final publicationsProvider = Provider.of<PublicationProvider>(context);
    final userProvider = Provider.of<AuthProvider>(context);
    final publications = filterOutByNid(publicationsProvider.publications, userProvider.user!.nid);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Publicaciones', style: CustomLabels.h1),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 385, // Ajusta 400 al tamaño deseado
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: publications.length,
              itemBuilder: (context, index) {
                final publication = publications[index];
                return PublicationDisplayed(
                  onPressed: (){
                    showModalBottomSheet(
                      context: context, 
                      builder: (_) => CreateOfferModal(publication: publication, products: productProvider.products),
                    );
                  },
                  product: publication.product.name,
                  owner: publication.owner.name,
                  title: publication.title,
                  description: publication.description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Publication> filterOutByNid(List<Publication> publications, String nid) {
      return publications.where((publication) => publication.owner.nid != nid).toList();
    }
}
