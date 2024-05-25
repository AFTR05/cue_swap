
import 'package:cue_swap/ui/layouts/no_page_found.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {

  static Handler noPageFound = Handler(
    handlerFunc: (context,params){
      return const NoPageFoundLayout();
    });

  
}