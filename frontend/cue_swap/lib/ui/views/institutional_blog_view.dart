import 'package:cue_swap/ui/cards/white_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class InstitutionalBlogView extends StatelessWidget {
  const InstitutionalBlogView({super.key});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: 'Economía Circular'),
          SectionContent(
            content: 'La economía circular es un modelo de producción y consumo que implica compartir, alquilar, reutilizar, reparar, renovar y reciclar materiales y productos existentes tantas veces como sea posible. De esta manera, se extiende el ciclo de vida de los productos.',
          ),
          SectionTitle(title: 'Consejos para Extender la Vida Útil de los Productos'),
          AdviceList(),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(106, 133, 160, 1),
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final String content;

  SectionContent({required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        content,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class AdviceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdviceCard(
          title: 'Reparar en lugar de reemplazar',
          description: 'Antes de desechar un producto, considera si puede ser reparado. A menudo, una simple reparación puede extender la vida útil del producto significativamente.',
        ),
        AdviceCard(
          title: 'Comprar productos de calidad',
          description: 'Invertir en productos de alta calidad puede parecer costoso al principio, pero estos productos tienden a durar más tiempo y son menos propensos a necesitar reemplazos frecuentes.',
        ),
        AdviceCard(
          title: 'Realizar mantenimiento regular',
          description: 'Mantener tus productos en buen estado con un mantenimiento regular puede prevenir fallas y prolongar su vida útil.',
        ),
        AdviceCard(
          title: 'Reutilizar y reciclar',
          description: 'Encuentra nuevas formas de reutilizar los productos que ya no necesitas. También, asegúrate de reciclar correctamente aquellos productos que han llegado al final de su vida útil.',
        ),
      ],
    );
  }
}

class AdviceCard extends StatelessWidget {
  final String title;
  final String description;

  AdviceCard({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(106, 133, 160, 1),
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}