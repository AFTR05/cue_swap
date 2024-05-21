import 'package:flutter/material.dart';

class NotificationsService {

  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackbarError(String message){
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);

  }

  static showSnackbar(String message){
    final snackBar = SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
      ),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  } 

  static showBusyIndicator(BuildContext context){
    final AlertDialog dialog = AlertDialog(
      backgroundColor: Color.fromRGBO(21, 22, 23,1),
      content: Container(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),
      ),
    );
    showDialog(context: context, builder: ( _ ) => dialog,); 
  }
  
}