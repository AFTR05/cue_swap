import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static navigateTo(String routeName){
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static replaceTo(String routeName){
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static void refresh() {
    html.window.location.reload();
}

}