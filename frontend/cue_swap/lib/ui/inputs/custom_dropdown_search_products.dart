
import 'package:cue_swap/models/product.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class CustomDropdownSearchProducts extends StatelessWidget {
  final List<Product> products;
  final Function(Product?) onChanged;

  const CustomDropdownSearchProducts({super.key, required this.products, required this.onChanged, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownSearch<Product>(
        items: products,
        dropdownDecoratorProps: DropDownDecoratorProps(
          dropdownSearchDecoration: InputDecoration(
            labelText: "Selecciona un producto",
            labelStyle: CustomLabels.labelFormStyle,
            hintText: "Busqueda por producto",
            hintStyle: CustomLabels.hintFormStyle,
            contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            border: const OutlineInputBorder(),
          ),
        ),
        itemAsString: (Product product) => product.name, // Customize display
        onChanged: onChanged
      ),
    );
  }
}
