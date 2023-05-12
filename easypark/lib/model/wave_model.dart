import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final user = FirebaseAuth.instance.currentUser!;
String userID = user.uid;

class WaveModel {
  Stream<DocumentSnapshot> getUserDetails() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('wavetest')
        .doc(userIds)
        .snapshots();
  }

  Future updateUserResults(String imageURL, String message) async {
    await FirebaseFirestore.instance.collection('wavetest').doc(userID).update(
      {
        'imageURL': imageURL,
        'message': message,
      },
    );
  }

  Future addUserResults(String userId, String imageURL, String message) async {
    await FirebaseFirestore.instance.collection('wavetest').add(
      {
        'userid': userId,
        'imageURL': imageURL,
        'message': message,
      },
    );
  }

  Future deleteUserResult(String userId) async {
    await FirebaseFirestore.instance
        .collection('wavetest')
        .doc(userId)
        .delete();
  }
}
