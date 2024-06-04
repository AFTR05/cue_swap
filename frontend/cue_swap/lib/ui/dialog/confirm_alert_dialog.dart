import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class ConfirmAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String afirmativeOption;
  final Function onPressed;

  const ConfirmAlertDialog({super.key, required this.title, required this.content, required this.afirmativeOption, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      iconColor: Colors.white,
      title: Text(title, style: CustomLabels.h2),
      content: Text(content, style: CustomLabels.hintFormStyle),
      actions: [
        TextButton(
          child: Text('No', style: CustomLabels.tableData,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(afirmativeOption, style: CustomLabels.tableData),
          onPressed: () => onPressed(), 
      )
      ],
    );
  }
}