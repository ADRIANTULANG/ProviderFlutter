import 'dart:async';

import 'package:flutter/material.dart';

class SplashloadingController extends ChangeNotifier {
  bool isLoading;

  SplashloadingController({this.isLoading = true});

  setData() async {
    Timer(Duration(seconds: 3), () {
      isLoading = false;
    });
    notifyListeners();
  }
}
