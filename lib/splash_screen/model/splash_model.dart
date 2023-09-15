import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  String name;
  int age;
  bool userModelBool;

  UserModel({
    required this.name,
    required this.age,
    required this.userModelBool,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        age: json["age"],
        userModelBool: json["bool"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "bool": userModelBool,
      };
}
