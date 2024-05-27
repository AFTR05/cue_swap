
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/side_menu_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/ui/labels/custom_labels.dart';
import 'package:cue_swap/ui/shared/widgets/navbar_avatar.dart';
import 'package:cue_swap/ui/shared/widgets/notifications_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user= Provider.of<AuthProvider>(context).user!;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if(size.width<=840)
            IconButton(onPressed: ()=>SideMenuProvider.openMenu(), icon: const Icon(Icons.menu_outlined)),
          const SizedBox(width: 20),
          if(size.width>840)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 840),
              child: Text("Hola bienvenido ${user.name}", style: CustomLabels.navbarMessage,),
            ),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          NavbarAvatar(onPressed: (){
            NavigationService.replaceTo(Flurorouter.profileRoute);
            SideMenuProvider.closeMenu();
          },),
          const SizedBox(width: 10),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
        color: Colors.black12,
        blurRadius: 12
        )
      ]
    );
}