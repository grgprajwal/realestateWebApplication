import 'dart:convert';

import 'package:crypto/crypto.dart';
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

  static String generateSHA256(String input) {
    return sha256.convert(utf8.encode(input)).toString();
  }



}

