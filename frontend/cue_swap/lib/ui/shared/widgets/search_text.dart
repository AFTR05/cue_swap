
import 'package:cue_swap/ui/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      padding: EdgeInsets.only(bottom: 5),
      child: TextField(
        decoration: CustomInput.searchInputDecoration(hint: 'Buscar', icon: Icons.search_outlined)
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(0.1)
  );
}