import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'SWAP',
                style: CustomLabels.authTitle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.sync_rounded, 
                color: Color.fromRGBO(106, 133, 160, 1),
                size: 90.0,
                opticalSize: VisualDensity.maximumDensity,
              ),
            )
          ],
        ),
      ),
    );
  }
}