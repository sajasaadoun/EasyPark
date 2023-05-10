import 'package:easypark/model/user_data.dart';

import 'dart:convert';
import 'dart:core';

class UserModel {
  String name;
  String email;
  String password;
  String about;

  UserModel(
      {required this.name,
      required this.about,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'about': about,
      'password': password,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      about: map['about'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserPreferences {
  static const myUser = User(
    imagePath: 'https://cdn-icons-png.flaticon.com/512/146/146007.png',
    name: 'EgyMania User',
    email: 'EgyManiaUser@gmail.com',
    password: '123456',
    about:
        'A MIU Computer science students works on EgyMania project acts as User in this application.',
    isDarkMode: false,
  );
}
