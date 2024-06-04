import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/product_provider.dart';
import 'package:cue_swap/provider/publication_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/inputs/custom_dropdown_input_menu.dart';
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/create_offer_modal.dart';
import 'package:cue_swap/ui/widgets/publication_displayed.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  String _filterCategory = 'TODAS LAS CATEGORIAS';
  String _filterTitle = '';
  String _filterDescription = '';

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
    final List<Publication> publications = filterOutByNid(publicationsProvider.publications, userProvider.user!.nid);

    final filteredPublications = publications.where((publication) {
      final matchesCategory = _filterCategory == 'TODAS LAS CATEGORIAS' || publication.product.category.toLowerCase().contains(_filterCategory.toLowerCase());
      final matchesTitle = _filterTitle.isEmpty || publication.title.toLowerCase().contains(_filterTitle.toLowerCase());
      final matchesUser = _filterDescription.isEmpty || publication.description.toLowerCase().contains(_filterDescription.toLowerCase());
      return matchesCategory && matchesTitle && matchesUser;
    }).toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
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
                              text: '¿Quieres saber acerca de economía circular? ',
                              style: CustomLabels.tableHeader,
                            ),
                            TextSpan(
                              text: ' Accede aquí',
                              style: CustomLabels.textSpanLink.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Flurorouter.institutionalBlogRoute);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
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
              const SizedBox(width: 5), // Agregar espacio entre los widgets
              Expanded(child: _buildFilters()), // Usar Expanded para que el filtro ocupe el espacio disponible
            ],
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 385,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredPublications.length,
              itemBuilder: (context, index) {
                final publication = filteredPublications[index];
                return PublicationDisplayed(
                  onPressed: () {
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

  Widget _buildFilters() {
  return WhiteCard(
    title: 'Filtros de Publicaciones',
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: TextField(
                decoration: CustomInput.filterInputDecoration(
                  hint: 'Título',
                  label: 'Título',
                  icon: Icons.info_outline,
                ),
                onChanged: (value) {
                  setState(() {
                    _filterTitle = value;
                  });
                },
              ),
            ),
            SizedBox(width: 10),
            Flexible(
              child: TextField(
                decoration: CustomInput.filterInputDecoration(
                  hint: 'Descripción',
                  label: 'Descripción',
                  icon: Icons.info_outline,
                ),
                onChanged: (value) {
                  setState(() {
                    _filterDescription = value;
                  });
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Reduce el espacio vertical entre los elementos
        CustomDropdownInputMenu(
          options: const [
            "TODAS LAS CATEGORIAS",
            "PRODUCTOS_USADOS",
            "UNIFORMES",
            "LIBROS",
          ],
          label: 'Categoría',
          onSelectedOptionChanged: (selectedOption) {
            setState(() {
              _filterCategory = selectedOption;
            });
          },
        ),
      ],
    ),
  );
}

}
