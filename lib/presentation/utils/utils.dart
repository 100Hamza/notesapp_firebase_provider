import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:notesapp_firebase_provider/ui_config/front_end_config.dart';

class Utils {
  void toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: Colors.orange,
        fontSize: 16.0,
        gravity: ToastGravity.TOP
    );
  }
}
