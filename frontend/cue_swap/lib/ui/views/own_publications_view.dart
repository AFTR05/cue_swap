import 'package:cue_swap/datatables/own_publications_datasource.dart';
import 'package:cue_swap/provider/product_provider.dart';
import 'package:cue_swap/provider/rating_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/modal/create_publication_modal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/ui/button/custom_icon_button.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class OwnPublicationsView extends StatefulWidget {
  const OwnPublicationsView({super.key});

  @override
  State<OwnPublicationsView> createState() => _OwnPublicationsViewState();
}

class _OwnPublicationsViewState extends State<OwnPublicationsView> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
    Provider.of<RatingProvider>(context, listen: false).getRatings();
  }
  
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final user = Provider.of<AuthProvider>(context).user!;
    final publications = user.publications;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Text('Mis publicaciones', style: CustomLabels.h1),
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
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: PaginatedDataTable(
                headingRowColor: const MaterialStatePropertyAll(
                  Color.fromRGBO(106, 133, 160, 1),
                ),
                
                columns: [
                  DataColumn(label: Text('Titulo', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Descripción', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Estado', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Producto', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Dueño', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Fecha', style: CustomLabels.tableHeader)),
                  DataColumn(label: Text('Acciones', style: CustomLabels.tableHeader)),
                ],
                source: OwnPublicationsDTS(publications!, context),
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                header: Text(
                  'Esta es la lista de las publicaciones que ha hecho el usuario',
                  maxLines: 2,
                  style: CustomLabels.navbarMessage,
                ),
                actions: [
                  CustomIconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) => CreatePublicationModal(products: productProvider.products),
                      );
                    },
                    text: 'Crear',
                    icon: Icons.add_outlined,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}