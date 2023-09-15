import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  bool colorBool;

  SplashController({this.colorBool = true});

  insideCounterMethod() async {
    if (colorBool == true) {
      colorBool = false;
    } else {
      colorBool = true;
    }
    notifyListeners();
  }
}
