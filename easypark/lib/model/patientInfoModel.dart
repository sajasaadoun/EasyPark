import 'package:cloud_firestore/cloud_firestore.dart';

class patientInfoModel {
  Stream<QuerySnapshot> patientInfoDetails() {
    return FirebaseFirestore.instance.collection('patientsinfo').snapshots();
  }

  Future updatepatientInfoDetails(
    String id,
    String name,
    String age,
    String medications,
    String phonenumber,
  ) async {
    final doctorRef = FirebaseFirestore.instance.collection('patientsinfo');
    final DoctorQuery = doctorRef.doc(id);
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final doctorSnapshot = await DoctorQuery.get();

    doctorSnapshot.reference.update({
      "name": name,
      "age": age,
      'phone': phonenumber,
      'medications': medications,
    });
  }
}
