import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text('Publicaciones',style: CustomLabels.h1),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Publicaciones',
            child: Text('Hola mundo')
          )
        ],
      )
    );
  }
}