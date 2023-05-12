import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientReport extends ConsumerStatefulWidget {
  // final DocumentSnapshot document;
  // PatientReport(this.document);
  @override
  ConsumerState<PatientReport> createState() => _PatientReportState();
}

class _PatientReportState extends ConsumerState<PatientReport> {
  TextEditingController _medicationsController = TextEditingController();

  String _patientName = 'Amgad Besheer';
  String _age = '56';
  String _diagnosis = 'Has Parkinson disease';

  void _savePatientReport() {
    // Save the data entered by the user to a database or file.
    print('Patient Name: $_patientName');
    print('Age: $_age');
    print('Diagnosis: $_diagnosis');
    print('Severity Level: $_age');
    print('Spiral Test Result: $_age');
    print('Wave Test Result: $_age');
    print('Face Test Result: $_age');
    print('Voice Test Result: $_age');
    print('Medications: ${_medicationsController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Report'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'doctor');
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Patient Name:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _patientName,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Patient Age:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _age,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Diagnosis:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _diagnosis,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Severity Level:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _diagnosis,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Spiral Test Result:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _diagnosis,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Wave Test Result:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _diagnosis,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Face Test Result:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _diagnosis,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Voice Test Result:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  _diagnosis,
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Medications:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _medicationsController,
                  decoration: InputDecoration(
                    hintText: 'Enter medications if needed',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('Save'),
            onPressed: _savePatientReport,
          ),
        ],
      ),
    );
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class PatientReport extends StatefulWidget {
//   final DocumentSnapshot document;

//   PatientReport(this.document);

//   @override
//   _PatientReportState createState() => _PatientReportState();
// }

// class _PatientReportState extends State<PatientReport> {
//   TextEditingController _medicationsController = TextEditingController();

//   String _medications = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Report'),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, 'doctor');
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('patientsinfo')
//             .doc(widget.document.id)
//             .snapshots(),
//         builder:
//             (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           Map<String, dynamic> patientData =
//               snapshot.data!.data() as Map<String, dynamic>;
//           String patientName = patientData['name'] ?? 'Unknown';
//           String age = patientData['Age'] ?? 'Unknown';
//           String diagnosis = patientData['diagnosis'] ?? 'Unknown';
//           return ListView(
//             padding: EdgeInsets.all(16.0),
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       'Patient Name:',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       patientName,
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                     SizedBox(height: 16.0),
//                     Text(
//                       'Patient Age:',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       age,
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                     SizedBox(height: 16.0),
//                     Text(
//                       'Diagnosis:',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 8.0),
//                     Text(
//                       diagnosis,
//                       style: TextStyle(fontSize: 16.0),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Container(
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.blue,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.blue,
//                       width: 2.0,
//                     ),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Medications:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8.0),
//                       TextField(
//                         controller: _medicationsController,
//                         onChanged: (value) {
//                           setState(() {
//                             _medications = value;
//                           });
//                         },
//                         decoration: InputDecoration(
//                           hintText: 'Enter medications',
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                       SizedBox(height: 16.0),
//                       ElevatedButton(
//                         onPressed: () async {
//                           await FirebaseFirestore.instance
//                               .collection('patientsinfo')
//                               .doc(widget.document.id)
//                               .update({'medications': _medications});
//                           Navigator.pop(context);
//                         },
//                         child: Text('Save'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
