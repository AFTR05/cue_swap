import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SimulatedInput extends StatelessWidget {
  const SimulatedInput({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start  ,
        children: [
          Center(
            child: Row(
              children: [
                Center(child: Icon(icon, size: 24.0)),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    label + ':',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}