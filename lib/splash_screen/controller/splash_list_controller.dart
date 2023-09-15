import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/splash_model.dart';

class SplashListController extends ChangeNotifier {
  List<UserModel> listahan = [];

  SplashListController({required this.listahan});

  adddToList() async {
    var data = [
      {"name": "adrian", "age": 25, "bool": true},
      {"name": "mark", "age": 25, "bool": true},
    ];
    listahan.addAll(userModelFromJson((jsonEncode(data))));
    notifyListeners();
  }
}
