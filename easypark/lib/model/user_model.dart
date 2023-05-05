import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

// File? _image;
// String downloadURL = '';

// Future saveImage() async {
//   Reference referenceRoot = FirebaseStorage.instance.ref();
//   Reference referenceDirImage = referenceRoot.child('image');
//   String fileName =
//       '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(100000)}.jpg';
//   Reference referenceImageToUpload = referenceDirImage.child(fileName);
//   try {
//     await referenceImageToUpload.putFile(File(_image!.path));
//     downloadURL = await referenceImageToUpload.getDownloadURL();
//   } catch (e) {
//     print(e);
//   }
//   setState(() {
//     _image = File(_image!.path);
//   });
// }

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
