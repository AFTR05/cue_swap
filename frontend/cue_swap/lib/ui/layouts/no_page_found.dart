import 'package:cue_swap/ui/layouts/auth/widgets/custom_title.dart';
import 'package:cue_swap/ui/views/no_page_found.dart';
import 'package:flutter/material.dart';

class NoPageFoundLayout extends StatelessWidget {
  const NoPageFoundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column( // Envuelve Expanded en un Column
        children: [
          Expanded( // Mantén el Expanded aquí
            child: Scrollbar(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: [
                  (size.width > 1000)
                      ? const _DesktopBody(child: NoPageFoundView())
                      : const _MobileBody(child: NoPageFoundView())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
}


class _DesktopBody extends StatelessWidget {

  final Widget child;

  const _DesktopBody({
    Key? key, 
    required this.child
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox( height: 30 ),
                const CustomTitle(),
                Expanded(child: child ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {

  final Widget child;

  const _MobileBody({
    Key? key, 
    required this.child
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 1000,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox( height: 20 ),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 50,
          )
        ],
      ),
    );
  }
}


