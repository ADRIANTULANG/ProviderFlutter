import 'package:flutter/material.dart';

class SplashItemChangeController extends ChangeNotifier {
  String? nametochange;
  int? index;

  SplashItemChangeController({this.nametochange, this.index});

  Future<String> changeElement(
      {required String name, required int index}) async {
    nametochange = name;
    index = index;
    notifyListeners();
    return nametochange!;
  }
}
