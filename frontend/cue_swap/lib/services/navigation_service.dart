import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName){
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName){
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void refresh() {
  final overlayContext = navigatorKey.currentState?.overlay?.context;
  if (overlayContext != null) {
    final currentRoute = ModalRoute.of(overlayContext);
    if (currentRoute != null) {
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        currentRoute.settings.name!,
        (route) => false,
      );
    }
  }
}

}