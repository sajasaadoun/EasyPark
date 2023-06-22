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

  Future updateUserDetails(
      String userName, String userEmail, String password, String ln) async {
    final updateUser =
        FirebaseFirestore.instance.collection('users').doc(userID);
    updateUser.update(
      {
        'firstname': userName.trim(),
        'email': userEmail.trim(),
        'password': password.trim(),
        'lastname': ln.trim(),
      },
    );
  }
}

// Future<void> updateDiagnosedField(bool diagnosed) async {
//   final updateUser = FirebaseFirestore.instance.collection('users').doc(userID);
//   await updateUser.update({
//     'diagnosed': diagnosed,
//   });
// }
Future<void> updateDiagnosedField(String diagnosis) async {
  final updateUser = FirebaseFirestore.instance.collection('users').doc(userID);
  await updateUser.update({
    'diagnosed': diagnosis,
  });
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
