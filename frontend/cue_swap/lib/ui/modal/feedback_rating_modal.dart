import 'package:cue_swap/models/transaction.dart';
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/feedback_rating_form_provider.dart';
import 'package:cue_swap/provider/rating_provider.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/ui/button/custom_outlined_button.dart';
import 'package:cue_swap/ui/inputs/description_input.dart';
import 'package:cue_swap/ui/inputs/star_rating_widget.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedbackRatingModal extends StatelessWidget {
  final Transaction transaction;
  const FeedbackRatingModal({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (_) => FeedbackRatingFormProvider(),
      child: Builder(
        builder: (context) {
          final feedbackRatingFormProvider = Provider.of<FeedbackRatingFormProvider>(context);
          final authProvider = Provider.of<AuthProvider>(context);
          final ratingProvider = Provider.of<RatingProvider>(context);

          return Container(
            height: MediaQuery.of(context).size.height * 0.8, // Ajusta la altura según sea necesario
            decoration: buildBoxDecoration(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text('Retroalimentación de transacción', style: CustomLabels.h1),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Colors.black),
                    ),
                  ],
                ),
                Divider(color: Colors.white.withOpacity(0.3)),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: feedbackRatingFormProvider.formkey,
                            child: Column(
                              children: [
                                DescriptionInput(
                                  hintText: "Digite el comentario",
                                  maxLines: 1, 
                                  label: "Comentario de la transacción", 
                                  icon: Icons.info_outline, 
                                  onChanged: (value){
                                    feedbackRatingFormProvider.comment = value;
                                    feedbackRatingFormProvider.updateButtonState();
                                  }
                                ),
                                const SizedBox(height: 20),
                                Text("Calificación de la transacción" , style: CustomLabels.labelFormStyle,),
                                const SizedBox(height: 10),
                                StarRatingWidget(
                                  initialRating: 5.0,
                                  onRatingUpdate: (value){
                                    feedbackRatingFormProvider.qualification = value.round();
                                    feedbackRatingFormProvider.updateButtonState();
                                  },
                                ),
                                const SizedBox(height: 40),
                                CustomOutlinedButton(
                                  onPressed: () => onFormSubmit(
                                    feedbackRatingFormProvider,
                                    ratingProvider,
                                    transaction,
                                    authProvider,
                                    context,
                                  ),
                                  text: 'Crear',
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onFormSubmit(
    FeedbackRatingFormProvider feedbackRatingFormProvider,
    RatingProvider ratingProvider,
    Transaction transaction,
    AuthProvider authProvider,
    BuildContext context,
  ) {
    final isValid = feedbackRatingFormProvider.validateForm();
    if (isValid) {
      NotificationsService.showBusyIndicator(context);
      ratingProvider.createRating(
        feedbackRatingFormProvider.comment,
        feedbackRatingFormProvider.qualification,
        transaction.id,
        authProvider,
      );
      Navigator.of(context).pop();
    }
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black26),
        ],
  );
}
