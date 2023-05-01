import 'package:flutter/material.dart';

class PatientReport extends StatefulWidget {
  @override
  _PatientReportState createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReport> {
  TextEditingController _medicationsController = TextEditingController();
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _diagnosisController = TextEditingController();

//  String _patientNameController = 'Ahmed Kamal';
//   String _diagnosisController = 'Has parkinson disease';
  void _savePatientReport() {
    // Save the data entered by the user to a database or file.
    print('Patient Name: ${_patientNameController.text}');
    print('Diagnosis: ${_diagnosisController.text}');
    print('Age: ${_ageController.text}');
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
                TextField(
                  controller: _patientNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter patient name',
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Patient Age:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    hintText: 'Enter patient Age',
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Diagnosis:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _diagnosisController,
                  decoration: InputDecoration(
                    hintText: 'Enter diagnosis',
                  ),
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
                    hintText: 'Enter medications',
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

// class PatientReport extends StatefulWidget {
//   @override
//   _PatientReportState createState() => _PatientReportState();
// }

// class _PatientReportState extends State<PatientReport> {
//   TextEditingController _patientNameController = TextEditingController();
//   TextEditingController _ageController = TextEditingController();
//   TextEditingController _diagnosisController = TextEditingController();
//   TextEditingController _medicationsController = TextEditingController();
//   TextEditingController _remarksController = TextEditingController();

//   void _savePatientReport() {
//     // Save the data entered by the user to a database or file.
//     print('Patient Name: ${_patientNameController.text}');
//     print('Age: ${_ageController.text}');
//     print('Diagnosis: ${_diagnosisController.text}');
//     print('Medications: ${_medicationsController.text}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Report'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             TextField(
//               controller: _patientNameController,
//               decoration: InputDecoration(
//                 labelText: 'Patient Name',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _ageController,
//               decoration: InputDecoration(
//                 labelText: 'Age',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _diagnosisController,
//               decoration: InputDecoration(
//                 labelText: 'Diagnosis',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _medicationsController,
//               decoration: InputDecoration(
//                 labelText: 'Medications',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               child: Text('Save'),
//               onPressed: _savePatientReport,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
