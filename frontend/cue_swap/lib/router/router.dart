import 'package:cue_swap/router/auth_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  static String rootRoute = '/';
  static String loginRoute = '/auth/sign_in';
  static String signUpRoute = '/auth/sign_up';

  static void configureRoutes(){
    // Auth Handler
    router.define(rootRoute, handler: AuthHandlers.signUp,transitionType: TransitionType.none);
    router.define(loginRoute, handler: AuthHandlers.login,transitionType: TransitionType.none);
    router.define(signUpRoute, handler: AuthHandlers.signUp, transitionType: TransitionType.none);
  }

}