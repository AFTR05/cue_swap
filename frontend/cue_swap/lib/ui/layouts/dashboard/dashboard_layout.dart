
import 'package:cue_swap/provider/side_menu_provider.dart';
import 'package:cue_swap/ui/shared/nav_bar.dart';
import 'package:cue_swap/ui/shared/side_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardLayout extends StatefulWidget {

  final Widget child;

  const DashboardLayout({
    Key? key, 
    required this.child
  }) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = AnimationController(vsync:  this,duration: Duration(milliseconds: 300));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              //TOdo mas de 700 px
              if(size.width >= 700)
                const SideBar(),
              Expanded(
                child: Column(
                  children: [
                    const Navbar(),
                    Expanded(child: Container(
                      child: widget.child,
                      
                    )),
                  ],
                )
              )
            ],
          ),

          if(size.width<700)
            AnimatedBuilder(
              animation: SideMenuProvider.menuController, 
              builder: (context,_) => Stack(
                children: [

                  if(SideMenuProvider.isOpen)
                    Opacity(
                      opacity: SideMenuProvider.opacity.value,
                      child: GestureDetector(
                        onTap: () => SideMenuProvider.closeMenu(),
                        child: Container(
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,

                        ),
                      ),
                    ),

                  Transform.translate(
                    offset: Offset(SideMenuProvider.movement.value, 0),
                    child: SideBar(),
                  )
                ],
              )
            )
        ],
      )
    );
  }
}