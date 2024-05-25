import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class NoPageFoundView extends StatelessWidget {
  const NoPageFoundView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: Center(
        child: Text(
          '404 - No Page Found',
          style: CustomLabels.noPageFound,
        ),
      ),
    );
  }
}