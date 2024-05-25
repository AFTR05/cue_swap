import 'package:cue_swap/provider/auth_provider.dart';
import 'package:cue_swap/services/layout_switcher.dart';
import 'package:cue_swap/ui/layouts/auth/auth_layout.dart';
import 'package:cue_swap/ui/layouts/auth/sign_up_layout.dart';
import 'package:cue_swap/ui/views/dashboard_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

class AuthHandlers {

  static Handler login = Handler(
    handlerFunc: ( context, params ) {

      final authProvider = Provider.of<AuthProvider>(context!);

      if ( authProvider.authStatus == AuthStatus.notAuthenticated ) {
        return const AuthLayout();
      } else {
        return LayoutSwitcher().usePrincipalLayout(const DashboardView());
      }

    }
  );

  static Handler signUp = Handler(
    handlerFunc: ( context, params ) {
      
      final authProvider = Provider.of<AuthProvider>(context!);
      
      if ( authProvider.authStatus == AuthStatus.notAuthenticated ) {
        return const SignUpLayout();
      } else {
        return LayoutSwitcher().usePrincipalLayout(const DashboardView());
      }
    }
  );
}