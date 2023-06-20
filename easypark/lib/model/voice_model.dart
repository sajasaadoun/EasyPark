import 'dart:math';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final user = FirebaseAuth.instance.currentUser!;
String userID = user.uid;

class VoiceModel {
  Stream<DocumentSnapshot> getUserDetails() {
    final user = FirebaseAuth.instance.currentUser!;
    String userIds = user.uid;
    return FirebaseFirestore.instance
        .collection('voicetest')
        .doc(userIds)
        .snapshots();
  }

  Future updateUserResults(String voiceRecord, String message) async {
    await FirebaseFirestore.instance.collection('voicetest').doc(userID).update(
      {
        'voiceRecord': voiceRecord,
        'message': message,
      },
    );
  }

  Future addUserResults(
      String userId, String voiceRecord, String message) async {
    await FirebaseFirestore.instance.collection('voicetest').add(
      {
        'userid': userId,
        'voiceRecord': voiceRecord,
        'message': message,
      },
    );
  }

  Future deleteUserResult(String userId) async {
    await FirebaseFirestore.instance
        .collection('voicetest')
        .doc(userId)
        .delete();
  }
}
