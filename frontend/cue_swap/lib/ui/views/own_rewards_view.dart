import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/widgets/reward_data_displayed.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OwnRewardsView extends StatelessWidget {
  const OwnRewardsView({Key? key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    final rewards = userProvider.user!.rewards;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mis recompensas', style: CustomLabels.h1),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 384, // Ajusta 400 al tamaño deseado
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return RewardDataDisplayed(
                  imageUrl: 'https://cdn-icons-png.flaticon.com/512/6150/6150035.png',
                  title: reward.title,
                  description: reward.description,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
