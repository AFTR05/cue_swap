import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SWAP',
            style: CustomLabels.dashboardTitle
          ),
          Icon(
            Icons.sync_rounded,
            color: Colors.black.withOpacity(0.6),
            size: 45,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}