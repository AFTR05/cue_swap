import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/provider/side_menu_provider.dart';
import 'package:cue_swap/router/router.dart';
import 'package:cue_swap/services/layout_switcher.dart';
import 'package:cue_swap/ui/layouts/auth/auth_layout.dart';
import 'package:cue_swap/ui/views/complaints_view.dart';
import 'package:cue_swap/ui/views/dashboard_view.dart';
import 'package:cue_swap/ui/views/institutional_blog_view.dart';
import 'package:cue_swap/ui/views/own_offers_view.dart';
import 'package:cue_swap/ui/views/own_products_view.dart';
import 'package:cue_swap/ui/views/own_publication_view.dart';
import 'package:cue_swap/ui/views/own_publications_view.dart';
import 'package:cue_swap/ui/views/own_rewards_view.dart';
import 'package:cue_swap/ui/views/own_transaction_view.dart';
import 'package:cue_swap/ui/views/own_transactions_view.dart';
import 'package:cue_swap/ui/views/rewards_view.dart';
import 'package:cue_swap/ui/views/user_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.dashboardRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const DashboardView());
      } else {
        return const AuthLayout();
      }
    }
  );
  
  static Handler rewards = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.rewardsRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const RewardsView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler ownProducts = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myProductsRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const OwnProductsView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler ownOffers = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myOffersRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const OwnOffersView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler ownPublications = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myPublicationsRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const OwnPublicationsView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler ownPublication = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myPublicationRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ){
        if(params['id']?.first != null){
          return LayoutSwitcher().usePrincipalLayout(OwnPublicationView(id: params['id']!.first));
        } else{
          return LayoutSwitcher().usePrincipalLayout(const OwnPublicationsView());
        }
      } else {
        return const AuthLayout();
      }   
    }
  );

  static Handler ownTransfers = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myTransfersRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const OwnTransactionsView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler ownTransfer = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myTransferRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ){
        if(params['id']?.first != null){
          return LayoutSwitcher().usePrincipalLayout(OwnTransactionView(id: params['id']!.first));
        } else{
          return LayoutSwitcher().usePrincipalLayout(const OwnTransactionsView());
        }
      } else {
        return const AuthLayout();
      }   
    }
  );

  static Handler ownRewards = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.myRewardsRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const OwnRewardsView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler complaints = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.complaintsRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const ComplaintsView());
      } else {
        return const AuthLayout();
      }
    }
  );

  static Handler institutionalBlog = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.institutionalBlogRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const InstitutionalBlogView());
      } else {
        return const AuthLayout();
      }
    }
  );


  static Handler profile = Handler(
    handlerFunc: ( context, params ) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context,listen: false)
        .setCurrentPage(Flurorouter.profileRoute);
      if ( authProvider.authStatus == AuthStatus.authenticated ) {
        return LayoutSwitcher().usePrincipalLayout(const UserView());
      } else {
        return const AuthLayout();
      }
    }
  );
}