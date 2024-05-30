
import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/side_menu_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/ui/shared/widgets/logo.dart';
import 'package:cue_swap/ui/shared/widgets/menu_item.dart';
import 'package:cue_swap/ui/shared/widgets/text_separator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SideBar extends StatelessWidget {
  const SideBar({super.key});

  void navigateTo(String route){
    NavigationService.replaceTo(route);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 300,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50
          ),
          const TextSeparator(text:'main'),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
            text:'Publicaciones',
            icon: Icons.shopping_cart_outlined,
            onPressed: ()  {
              navigateTo(Flurorouter.dashboardRoute);
            }
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.rewardsRoute,
            text:'Recompensas',
            icon: Icons.redeem_outlined,
            onPressed: ()  {
              navigateTo(Flurorouter.rewardsRoute);
            }
          ),
          MenuItem(
            text:'Mis productos',
            icon: Icons.inventory_2_outlined,
            onPressed: ()=> navigateTo(Flurorouter.myProductsRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.myProductsRoute,
          ),
          MenuItem(
            text:'Mis publicaciones',
            icon: Icons.collections_bookmark_outlined,
            onPressed: ()=>navigateTo(Flurorouter.myPublicationsRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.myPublicationsRoute,
          ),
          MenuItem(
            text:'Mis ofertas',
            icon: Icons.shopping_basket_outlined,
            onPressed: ()=>navigateTo(Flurorouter.myOffersRoute),
            isActive: sideMenuProvider.currentPage == Flurorouter.myOffersRoute,
          ),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.myTransfersRoute,
            text:'Mis trasferencias',
            icon: Icons.attach_money_outlined,
            onPressed: ()=>navigateTo(Flurorouter.myTransfersRoute)),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.myRewardsRoute,
            text:'Mis recompensas',
            icon: Icons.emoji_events_outlined,
            onPressed: ()=>navigateTo(Flurorouter.myRewardsRoute)),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.complaintsRoute,
            text:'Denuncias',
            icon: Icons.report_outlined,
            onPressed: ()=>navigateTo(Flurorouter.complaintsRoute)),
          MenuItem(
            isActive: sideMenuProvider.currentPage == Flurorouter.institutionalBlogRoute,
            text:'Blog institucional',
            icon: Icons.dashboard_outlined,
            onPressed: ()=>navigateTo(Flurorouter.institutionalBlogRoute)),
          const SizedBox(height: 50),
          const TextSeparator(text:'Exit'),
          MenuItem(
            text:'Logout',
            icon: Icons.exit_to_app_outlined,
            onPressed: (){
              Provider.of<AuthProvider>(context,listen: false)
                .logout();
            }
          ),
          
          
          
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(106, 131, 160, 1),
        Color.fromRGBO(106, 131, 160, 0.8)
      ]
    ),
    boxShadow:[
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ] 
  );
}