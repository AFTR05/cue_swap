import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomDropdownInputMenu extends StatefulWidget {
  final List<String> options;
  final String label; 
  final ValueChanged<String> onSelectedOptionChanged;

  const CustomDropdownInputMenu({
    super.key,
    required this.options,
    required this.label, required this.onSelectedOptionChanged
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropdownInputMenuState createState() => _CustomDropdownInputMenuState();
}

class _CustomDropdownInputMenuState extends State<CustomDropdownInputMenu> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.options.isNotEmpty ? widget.options[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                child: Text(
                  widget.label,
                  style: CustomLabels.labelFormStyle,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 15),
            child: DropdownButton<String>(
              style: GoogleFonts.ubuntu(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              dropdownColor: Colors.white,
              alignment: Alignment.topLeft,
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black),
              iconSize: 30,
              underline: Container(),
              value: _selectedOption,
              items: widget.options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              isExpanded: true,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    _selectedOption = newValue;
                    widget.onSelectedOptionChanged(newValue);
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
