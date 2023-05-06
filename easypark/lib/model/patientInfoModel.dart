import 'package:cloud_firestore/cloud_firestore.dart';

class patientInfoModel {
  Stream<QuerySnapshot> patientInfoDetails() {
    return FirebaseFirestore.instance.collection('patientsinfo').snapshots();
  }

  Future updatepatientInfoDetails(
    String id,
    String name,
    String email,
    String city,
    String location,
    String phonenumber,
    String price,
    String description,
    String password,
  ) async {
    final doctorRef = FirebaseFirestore.instance.collection('doctors');
    final DoctorQuery = doctorRef.doc(id);
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final doctorSnapshot = await DoctorQuery.get();

    doctorSnapshot.reference.update({
      "name": name,
      "city": city,
      "location": location,
      'email ': email,
      'phone': phonenumber,
      'price': '100',
      'password': '12345',
      'description': 'Specialist in Parkinson disease',
    });
  }
}
