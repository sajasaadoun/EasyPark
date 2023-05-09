import 'package:cloud_firestore/cloud_firestore.dart';

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
}
