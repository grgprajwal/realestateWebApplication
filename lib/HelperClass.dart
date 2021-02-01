import 'package:flutter/material.dart';

class HelperClass{

  static void popUpDialog(String message, BuildContext context) {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text(message),
        actions: [
          // FlatButton(
          //   child: Text('OK'),
          //   onPressed: () => Navigator.of(context).pop(),
          // ),
        ],
      ),
    );
  }




}

