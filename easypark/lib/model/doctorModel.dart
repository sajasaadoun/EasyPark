import 'package:cloud_firestore/cloud_firestore.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class DoctorModel {
  Stream<QuerySnapshot> doctorsDetails() {
    return FirebaseFirestore.instance.collection('doctors').snapshots();
  }

  Future updateDoctorDetails(
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
      'price': price,
      'password': '12345',
      'description': 'Specialist in Parkinson disease',
    });
  }

  Future deleteDoctor({required String id}) async {
    FirebaseFirestore.instance.collection("doctors").doc(id).delete();
  }

  Future doctorAdded({
    required String name,
    required String nameAr,
    required String email,
    required String city,
    required String cityAr,
    required String location,
    required String locationAr,
    required String phonenumber,
    required String price,
    required String description,
    required String descriptionAr,
    required String password,
  }) async {
    //create a document to get its ID
    final newDocument = FirebaseFirestore.instance.collection('doctors').doc();
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(newDocument.id)
        .set({
      "name": name,
      "nameAr": nameAr,
      "city": city,
      "cityAr": cityAr,
      "location": location,
      "locationAr": locationAr,
      'email ': email,
      'phone': phonenumber,
      'price': '100',
      'password': '12345',
      'description': 'Specialist in Parkinson disease',
      'descriptionAr': 'متخصص في مرض باركنسون',
    });
  }
}
