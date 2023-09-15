import 'package:flutter/material.dart';

class SplashNewController extends ChangeNotifier {
  int counter;

  SplashNewController({
    this.counter = 0,
  });

  counterMethod() async {
    counter++;
    notifyListeners();
  }
}
