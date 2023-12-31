import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toast {
  static errorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: const Color.fromARGB(255, 60, 53, 203),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
