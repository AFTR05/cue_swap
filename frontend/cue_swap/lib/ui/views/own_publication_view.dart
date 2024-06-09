import 'package:cue_swap/models/publication.dart';
import 'package:cue_swap/models/rating.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/rating_provider.dart';
import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/views/content/own_publication_view_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnPublicationView extends StatelessWidget {

  final String id;

  const OwnPublicationView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user!;
    final ratingProvider = Provider.of<RatingProvider>(context);
    final rating= filterRatingsByPublicationId(ratingProvider.allRatings, int.parse(id));
    final publications = user.publications;
    final publication = publications!.where((publication) => publication.id == int.parse(id)).toList();
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10 ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Publication', style: CustomLabels.h1 ),

          const SizedBox( height: 10 ),
          _OwnPublicationViewBody(rating: rating, publication: publication[0])

        ],
      ),
    );
  }
}

class _OwnPublicationViewBody extends StatelessWidget {
  final Publication publication;
  final List<Rating> rating;

  const _OwnPublicationViewBody({required this.publication, required this.rating});


  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FixedColumnWidth(250)
      },
    
      children: [
        TableRow(
          children: [
            _AvatarContainer(publication: publication,),
            OwnPublicationViewForm(publication: publication, ratings: rating),
          ]
        )
      ],
    );
  }

  
}

List<Rating> filterRatingsByPublicationId(List<Rating> ratings, int publicationId) {
      return ratings.where((rating) => rating.transaction.offer.publication.id==publicationId).toList();
    }




class _AvatarContainer extends StatelessWidget {

  final Publication publication;

  const _AvatarContainer({required this.publication});

  @override
  Widget build(BuildContext context) {

    const image= Image(image: AssetImage('publicidad-digital.png'), );

    return WhiteCard(
      width: 250,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Publication', style: CustomLabels.h2),
            const SizedBox( height: 20 ),
            const SizedBox(
              width: 150,
              height: 160,
              child: Stack(
                children: [
                  ClipOval(
                    clipBehavior: Clip.none,
                    child: image
                  )
                ],
              )
            ),
            const SizedBox( height: 20 ),
            Text(
              publication.title,
              style: CustomLabels.h2,
              textAlign: TextAlign.center,
            )
          ],
        ),
      )
    );
  }
}