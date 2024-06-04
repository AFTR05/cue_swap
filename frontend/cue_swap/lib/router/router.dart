import 'package:cue_swap/router/auth_handlers.dart';
import 'package:cue_swap/router/dashboard_handlers.dart';
import 'package:cue_swap/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  static String loginRoute = '/auth/sign_in';
  static String signUpRoute = '/auth/sign_up';

  //Dashboard
  static String dashboardRoute = '/dashboard';
  static String rewardsRoute = '/dashboard/rewards';
  static String myProductsRoute = '/dashboard/my_products';
  static String myPublicationsRoute = '/dashboard/my_publications';  
  static String myPublicationRoute = '/dashboard/my_publication/:id';
  static String myTransfersRoute = '/dashboard/my_transfers';
  static String myTransferRoute = '/dashboard/my_transfer/:id';
  static String myOffersRoute = '/dashboard/my_offers';
  static String myRewardsRoute = '/dashboard/my_rewards';
  static String complaintsRoute = '/dashboard/complaints';
  static String institutionalBlogRoute = '/dashboard/institutional_blog';
  static String profileRoute = '/dashboard/profile';

  static void configureRoutes(){
    // Auth Handler
    router.define(rootRoute, handler: AuthHandlers.login,transitionType: TransitionType.none);
    router.define(loginRoute, handler: AuthHandlers.login,transitionType: TransitionType.none);
    router.define(signUpRoute, handler: AuthHandlers.signUp, transitionType: TransitionType.none);
    // Dashboard Handler
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.none);
    router.define(rewardsRoute, handler: DashboardHandlers.rewards, transitionType: TransitionType.none);
    router.define(myProductsRoute, handler: DashboardHandlers.ownProducts, transitionType: TransitionType.none);
    router.define(myPublicationsRoute, handler: DashboardHandlers.ownPublications, transitionType: TransitionType.none);
    router.define(myPublicationRoute, handler: DashboardHandlers.ownPublication, transitionType: TransitionType.none);
    router.define(myTransfersRoute, handler: DashboardHandlers.ownTransfers, transitionType: TransitionType.none);
    router.define(myTransferRoute, handler: DashboardHandlers.ownTransfer, transitionType: TransitionType.none);
    
    router.define(myRewardsRoute, handler: DashboardHandlers.ownRewards, transitionType: TransitionType.none);
    router.define(myOffersRoute, handler: DashboardHandlers.ownOffers, transitionType: TransitionType.none);
    router.define(complaintsRoute, handler: DashboardHandlers.complaints, transitionType: TransitionType.none);
    router.define(institutionalBlogRoute, handler: DashboardHandlers.institutionalBlog, transitionType: TransitionType.none);
    router.define(profileRoute, handler: DashboardHandlers.profile, transitionType: TransitionType.none);
    
    //no page found
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }

}