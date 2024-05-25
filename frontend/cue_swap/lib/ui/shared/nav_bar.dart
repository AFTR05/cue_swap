
import 'package:cue_swap/provider/side_menu_provider.dart';
import 'package:cue_swap/ui/shared/widgets/navbar_avatar.dart';
import 'package:cue_swap/ui/shared/widgets/notifications_indicator.dart';
import 'package:cue_swap/ui/shared/widgets/search_text.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if(size.width<=700)
            IconButton(onPressed: ()=>SideMenuProvider.openMenu(), icon: const Icon(Icons.menu_outlined)),
          const SizedBox(width: 5),
          if(size.width>390)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const SearchText(),
            ),
          const Spacer(),
          const NotificationsIndicator(),
          const SizedBox(width: 10),
          const NavbarAvatar(),
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