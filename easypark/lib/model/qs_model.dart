import 'package:cloud_firestore/cloud_firestore.dart';

//--------------------------Connecting With Firebase ---------------------------//
//functions start it lower cases
class quesModel {
  // Stream<QuerySnapshot> questionDetails() {
  //   return FirebaseFirestore.instance.collection('questionnaire').snapshots();
  // }

  // Future updateDoctorDetails(
  //    String question,
  //    String option1,
  //    String option2,
  //    String option3,
  //    String option4,
  //    String option5
  // ) async {
  //   final doctorRef = FirebaseFirestore.instance.collection('questionnaire');
  //   final DoctorQuery = doctorRef.doc(id);
  //   // final eventQuery = eventRef.where('name', isEqualTo: name);
  //   final doctorSnapshot = await DoctorQuery.get();

  //   doctorSnapshot.reference.update({
  //      "question": question,
  //     "option1": option1,
  //     "option2": option2,
  //     'option3 ': option3,
  //     'option4': option4,
  //     'option5': option5,
  //   });
  // }

  Future deleteDoctor({required String id}) async {
    FirebaseFirestore.instance.collection("questionnaire").doc(id).delete();
  }

  Future questionAdded({
    required String question,
    required String option1,
    required String option2,
    required String option3,
    required String option4,
    required String option5
  }) async {
    //create a document to get its ID
    final newDocument = FirebaseFirestore.instance.collection('questionnaire').doc();
    await FirebaseFirestore.instance
        .collection('questionnaire')
        .doc(newDocument.id)
        .set({
      "question": question,
      "option1": option1,
      "option2": option2,
      'option3 ': option3,
      'option4': option4,
      'option5': option5 });
  }
}
