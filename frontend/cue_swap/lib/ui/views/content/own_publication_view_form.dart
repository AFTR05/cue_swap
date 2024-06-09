
import 'package:cue_swap/datatables/own_publication_offers_datasource.dart';
import 'package:cue_swap/models/offer.dart';
import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/models/rating.dart';
import 'package:cue_swap/provider/offer_provider.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/inputs/simulated_input.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/views/content/feedback_information.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OwnPublicationViewForm extends StatefulWidget {
  final Publication publication;
  final List<Rating> ratings;

  const OwnPublicationViewForm({super.key, 
    required this.publication, required this.ratings,
  });

  @override
  State<OwnPublicationViewForm> createState() => _OwnPublicationViewFormState();

  
}

class _OwnPublicationViewFormState extends State<OwnPublicationViewForm> {
  @override
  void initState() {
    super.initState();
    Provider.of<OfferProvider>(context, listen: false).getOffers();
  }
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    final offerProvider = Provider.of<OfferProvider>(context);
    final List<Offer> offers = offerProvider.offers;
    return Column(
      children: [
        PublicationInformation(publication: widget.publication),
        const SizedBox(height: 10),
        SingleChildScrollView(
          child: PaginatedDataTable(
            headingRowColor: const MaterialStatePropertyAll(
              Color.fromRGBO(106, 133, 160, 1),
            ),
            
            columns: [
              DataColumn(label: Text('Ofertador', style: CustomLabels.tableHeader)),
              DataColumn(label: Text('Estado', style: CustomLabels.tableHeader)),
              DataColumn(label: Text('Producto intercambiado', style: CustomLabels.tableHeader)),
              DataColumn(label: Text('Valor', style: CustomLabels.tableHeader)),
              DataColumn(label: Text('Fecha', style: CustomLabels.tableHeader)),
              DataColumn(label: Text('Acciones', style: CustomLabels.tableHeader)),
            ],
            source: OwnPublicationOffersDTS(filterOutByPublicationId(offers, widget.publication.id), context),
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
            )
          ),
        ),
        widget.ratings.isEmpty 
              ? Container()
              : FeedbackInformation(rating: widget.ratings[0])
      ],
    );
  }
}


class PublicationInformation extends StatelessWidget {
  const PublicationInformation({
    super.key,
    required this.publication,
  });

  final Publication publication;

  @override
  Widget build(BuildContext context) {
    return WhiteCard(
      title: 'Información de publicación',
      child: Column(
        children: [
          SimulatedInput(
            value: publication.title,
            label: 'Titulo', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: publication.description,
            label: 'Descripción', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: publication.state,
            label: 'Estado', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: DateFormat('yyyy-MM-dd').format(publication.date),
            label: 'Fecha', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: publication.owner.name,
            label: 'Dueño', 
            icon: Icons.info_outline_rounded
          ),
          const SizedBox(height: 20,),
          SimulatedInput(
            value: publication.product.name,
            label: 'Producto', 
            icon: Icons.info_outline_rounded
          ),
        ],
      )
    );
  }
}

List<Offer> filterOutByPublicationId(List<Offer> offers, int publicacionId) {
      return offers.where((offer) => offer.publication.id == publicacionId).toList();
    }
