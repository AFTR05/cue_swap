import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/complaint_provider.dart';
import 'package:cue_swap/provider/offer_provider.dart';
import 'package:cue_swap/provider/product_provider.dart';
import 'package:cue_swap/provider/publication_provider.dart';
import 'package:cue_swap/provider/rating_provider.dart';
import 'package:cue_swap/provider/rewards_provider.dart';
import 'package:cue_swap/provider/side_menu_provider.dart';
import 'package:cue_swap/provider/transaction_provider.dart';
import 'package:cue_swap/provider/user_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/local_storage.dart';
import 'package:cue_swap/services/navigation_service.dart';
import 'package:cue_swap/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}



class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(lazy: false, create: ( _ ) => AuthProvider()),
        ChangeNotifierProvider(lazy: false,create: ( _ ) => SideMenuProvider()),
        ChangeNotifierProvider(create: (_)=>RewardsProvider()),
        ChangeNotifierProvider(create: (_)=>UserProvider()),
        ChangeNotifierProvider(create: (_)=>ComplaintProvider()),
        ChangeNotifierProvider(create: (_)=>TransactionProvider()),
        ChangeNotifierProvider(create: (_)=>ProductProvider()),
        ChangeNotifierProvider(create: (_)=>PublicationProvider()),
        ChangeNotifierProvider(create: (_)=>OfferProvider()),
        ChangeNotifierProvider(create: (_)=>TransactionProvider()),
        ChangeNotifierProvider(create: (_)=>RatingProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swap',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(
            Colors.grey
          )
        )    
      )
    );
  }
}