import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/rewards_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:cue_swap/ui/cards/ad_card.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/widgets/reward_displayed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({Key? key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  @override
  void initState() {
    super.initState();
    Provider.of<RewardsProvider>(context, listen: false).getRewards();
  }

  @override
  Widget build(BuildContext context) {
    final rewardsProvider = Provider.of<RewardsProvider>(context);
    final userProvider = Provider.of<AuthProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Recompensas', style: CustomLabels.h1),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: AdCard(
                  width: 550,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: '¿Quieres saber acerca de economía circular? ',
                              style: CustomLabels.tableHeader,
                            ),
                            TextSpan(
                              text: ' Accede aquí',
                              style: CustomLabels.textSpanLink.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, Flurorouter.institutionalBlogRoute);
                                },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Icon(
                          Icons.eco_outlined,
                          color: Colors.white.withOpacity(0.7),
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 370, // Ajusta 400 al tamaño deseado
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: rewardsProvider.rewards.length,
              itemBuilder: (context, index) {
                final reward = rewardsProvider.rewards[index];
                return RewardDisplayed(
                  onPressed: (){
                    NotificationsService.showBusyIndicator(context);
                    rewardsProvider.redeemReward(userProvider.user!.id, reward.rewardId, userProvider);
                    Navigator.of(context).pop(); 
                  },
                  buttonControllerEnable: userProvider.user!.availablePoints >= reward.pointsValue,
                  valor: reward.pointsValue,
                  userPoints: userProvider.user!.availablePoints,
                  title: reward.title,
                  description: reward.description,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
