import 'package:flutter/material.dart';

class BackgroundSwap extends StatelessWidget {
  const BackgroundSwap({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration()
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('background.png'),
          fit: BoxFit.cover
        )
    );
  }
}

