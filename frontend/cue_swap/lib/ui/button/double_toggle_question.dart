import 'package:cue_swap/ui/button/custom_toggle_buttom.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class SimpleToggleQuestion extends StatelessWidget {
  const SimpleToggleQuestion({
    super.key, 
    required this.question, 
    required this.yesFunction, 
    required this.noFunction, 
    required this.optionController, 
    this.extendedAnswer, 
    this.extendedQuestion = const Center(), required this.leftOption, required this.rightOption
    }
  );

  final String question;
  final Function yesFunction;
  final Function noFunction;
  final String leftOption;
  final String rightOption;
  final bool? optionController;
  final bool? extendedAnswer;
  final Widget extendedQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.symmetric(
        vertical: 10
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 22
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.0),
      ),
      alignment: Alignment.center,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 420
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question,
                style: CustomLabels.simpleTongleQuestion,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              )
              ,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomToggleButton(
                    horizontalPadding: 10,
                    verticalPadding: 20,
                    onPressed: yesFunction, 
                    text: leftOption, 
                    isEnabled: optionController ?? false
                  ),
                  const SizedBox(
                    width: 80,
                  )
                  ,
                  CustomToggleButton(
                    horizontalPadding: 10,                    
                    verticalPadding: 20,
                    onPressed: noFunction, 
                    text: rightOption, 
                    isEnabled: optionController == null ? false : (!optionController!)
                  )
                ],
              ),
              optionController == extendedAnswer
                                  ? extendedQuestion
                                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}