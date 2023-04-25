import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class DoctorsModel {
  //Return all the doctors in the firebase
  Stream<QuerySnapshot> doctorsDetails() {
    return FirebaseFirestore.instance.collection('doctors').snapshots();
  }

  // update the doctors information
  Future updateDoctorDetails(
    String id,
    String description,
    String city,
    String location,
    String name,
    String price,
    String phone,
  ) async {
    final doctorsRef = FirebaseFirestore.instance.collection('doctors');
    final doctorsQuery = doctorsRef.doc(id);
    // final eventQuery = eventRef.where('name', isEqualTo: name);
    final eventSnapshot = await doctorsQuery.get();

    eventSnapshot.reference.update({
      'city': city,
      'location': location,
      'name': name,
      'phone': phone,
      "price": int.parse(price),
    });
  }

  // delete a doctor from the firebase
  Future deleteDoctor({required String id}) async {
    FirebaseFirestore.instance.collection("doctors").doc(id).delete();
  }

  // add a new doctor
  Future DoctorAdded({
    String? description,
    String? city,
    String? location,
    String? name,
    String? price,
    String? phone,
  }) async {
    //create a document to get its ID
    final newDocument = FirebaseFirestore.instance.collection('doctors').doc();
    await FirebaseFirestore.instance
        .collection('doctors')
        .doc(newDocument.id)
        .set({
      "name": name,
      "description": description,
      "city": city,
      "price": int.parse(price!),
      "location": location,
      "phone": int.parse(phone!),
    });
  }

  // // read a specific doctor with the id from the firebase
  // Stream<QuerySnapshot> getSpecificDoctor() {
  //   return FirebaseFirestore.instance
  //       .collection('doctors')
  //       .where('name', isEqualTo: 'saja')
  //       .snapshots();
  // }
}
