import 'package:cue_swap/ui/layouts/auth/auth_layout.dart';
import 'package:fluro/fluro.dart';

class AuthHandlers {
  static Handler login = Handler(
    handlerFunc: (context,params){
      return const AuthLayout();
    }
  );
}