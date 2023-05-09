import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class patientInfoModel {
  Stream<QuerySnapshot> patientInfoDetails() {
    return FirebaseFirestore.instance.collection('patientsinfo').snapshots();
  }

  Future updatepatientInfoDetails(
    String id,
    String name,
    String Age,
    String medications,
    String diagnosis,
  ) async {
    final doctorRef = FirebaseFirestore.instance.collection('patientsinfo');
    final DoctorQuery = doctorRef.doc(id);
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final doctorSnapshot = await DoctorQuery.get();

    doctorSnapshot.reference.update({
      "name": name,
      "Age": Age,
      'medications': medications,
      'diagnosis': diagnosis,
    });
  }

  Future editUserDetails(
      String userName, String userEmail, String userPassword) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update({
      'Name': userName,
      'Email': userEmail,
      'Password': userPassword,
    });
  }

  // Future addPatientInfo( String userId, String name,

  // )
}
