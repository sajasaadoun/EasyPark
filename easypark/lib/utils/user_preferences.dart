// import 'package:easypark/model/user.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class UserPreferences {
//   static const myUser = User(
//     imagePath: 'https://cdn-icons-png.flaticon.com/512/146/146007.png',
//     name: 'Amir',
//     email: 'amir1912710@miuegypt.edu.eg',
//     password: '123456',
//     about:
//         'A MIU Computer science students works on EasyPark Graduation project acts as Patient in this application.',
//     isDarkMode: false,
//   );
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;
String userID = user.uid;

class UserData {
  // Future<Object> getUserDetails() async {
  //   final user = FirebaseAuth.instance.currentUser!;
  //   String userIds = user.uid;
  //   final DocumentSnapshot documentSnapshot =
  //       await FirebaseFirestore.instance.collection('users').doc(userIds).get();
  //   return documentSnapshot;
  // }

  Stream<DocumentSnapshot> getUserDetails() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userIds)
        .snapshots();
  }

  Future<Object> getUserRole() async {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    final DocumentSnapshot documentSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userIds).get();
    return documentSnapshot;
  }

  Future updateUserDetails(String userName, String userEmail, String password,
      String age, String phone) async {
    final updateUser =
        FirebaseFirestore.instance.collection('users').doc(userID);
    updateUser.update(
      {
        'name': userName.trim(),
        'email': userEmail.trim(),
        'password': password.trim(),
        'age': age.trim(),
        'phone': phone.trim(),
      },
    );
  }
}

class User {
  final String imagePath;
  final String name;
  final String email;
  final String password;
  final String about;
  final bool isDarkMode;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.password,
    required this.about,
    required this.isDarkMode,
  });
}
