import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

// class UserData {
// ignore: non_constant_identifier_names
Future SignInAdmin(String email, String password) async {
  final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim()))
      .user;

  userId = user!.uid;
}


// Future CreateUser(String idd, String age, String diagnosed, String email,
//     String gender, String name, String password, String phone) async {
//   await FirebaseFirestore.instance.collection('users').doc(idd).set({
//     'id': idd,
//     'age': age,
//     'diagnosed': 1,
//     'email': email,
//     'gender': gender,
//     'name': name,
//     'password': password,
//     'phone': phone,
//   });
// }


