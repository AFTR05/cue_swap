import 'package:cue_swap/ui/layouts/auth/views/login_view.dart';
import 'package:cue_swap/ui/layouts/auth/widgets/background_swap.dart';
import 'package:cue_swap/ui/layouts/auth/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {

  const AuthLayout({
    super.key
  });
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final ScrollController _scrollController = ScrollController(initialScrollOffset: 0);

    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            ( size.width > 1000 )
              ? const _DesktopBody( child: LoginView())
              : const _MobileBody( child: LoginView() )
          ],
        ),
      )
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
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: size.width * 0.52  ,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox( height: 100 ),
                const CustomTitle(),
                const SizedBox( height: 60 ),
                Expanded(child: child ),
              ],
            ),
          ),
          const Expanded(child: BackgroundSwap())
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
      color: Colors.white,
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
            height: 417,
            child: BackgroundSwap(),
          )
        ],
      ),
    );
  }
}