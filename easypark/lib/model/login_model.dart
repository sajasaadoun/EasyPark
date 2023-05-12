import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

// class UserData {
Future SignIn(String email, String password) async {
  final User? user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim()))
      .user;

  userId = user!.uid;
}

class Userdata {
  Future<Object> getUserRole() async {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userIds).get();
    return documentSnapshot;
  }
}

Future SignUp(
    TextEditingController email, TextEditingController password) async {
  final User? newuser = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim()))
      .user;
  saveUser(
    'userImage',
    "name",
    email.text,
    password.text,
    'gender',
    'phone',
    'diagnosed',
    'age',
    'role',
  );
}

saveUser(
    String userImage,
    String name,
    String email,
    String password,
    String gender,
    String phone,
    String diagnosed,
    String age,
    String role) async {
  //Dont Put Instance common as it doesnt change when the user logs out
  final FirebaseFirestore db = FirebaseFirestore.instance;
  // final user = FirebaseAuth.instance.currentUser!;

  Map<String, dynamic> userData = {
    "userImage": userImage,
    "name": name,
    "email": user.email,
    "password": password,
    "gender": gender,
    "phone": phone,
    "diagnosed": 1,
    "age": age,
    "role": "user",
  };
  final userRef = db.collection("users").doc(user.uid);
  if ((await userRef.get()).exists) {
    // To Update Anything in the User
  } else {
    await userRef.set(userData);
  }
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


