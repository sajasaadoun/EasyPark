import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final user = FirebaseAuth.instance.currentUser!;
String userID = user.uid;

class FaceModel {
  Stream<DocumentSnapshot> getUserDetails() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('facetest')
        .doc(userIds)
        .snapshots();
  }

  Future updateUserResults(String imageURLSmile, String imageURLDisgusted,
      String imageURLSurprised, String message) async {
    await FirebaseFirestore.instance.collection('facetest').doc(userID).update(
      {
        'imageURLSmile': imageURLSmile,
        'imageURLDisgusted': imageURLDisgusted,
        'imageURLSurprised': imageURLSurprised,
        'message': message,
      },
    );
  }

  Future addUserResults(
      String userId,
      String imageURLSmile,
      String imageURLDisgusted,
      String imageURLSurprised,
      String message) async {
    await FirebaseFirestore.instance.collection('facetest').add(
      {
        'userid': userId,
        'imageURLSmile': imageURLSmile,
        'imageURLDisgusted': imageURLDisgusted,
        'imageURLSurprised': imageURLSurprised,
        'message': message,
      },
    );
  }

  Future deleteUserResult(String userId) async {
    await FirebaseFirestore.instance
        .collection('facetest')
        .doc(userId)
        .delete();
  }
}
