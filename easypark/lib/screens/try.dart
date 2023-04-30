import 'package:flutter/material.dart';

class PatientReport extends StatefulWidget {
  @override
  _PatientReportState createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReport> {
  TextEditingController _patientNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _diagnosisController = TextEditingController();
  TextEditingController _medicationsController = TextEditingController();
  TextEditingController _remarksController = TextEditingController();

  void _savePatientReport() {
    // Save the data entered by the user to a database or file.
    print('Patient Name: ${_patientNameController.text}');
    print('Age: ${_ageController.text}');
    print('Diagnosis: ${_diagnosisController.text}');
    print('Medications: ${_medicationsController.text}');
    print('Remarks: ${_remarksController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Report'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _patientNameController,
              decoration: InputDecoration(
                labelText: 'Patient Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _diagnosisController,
              decoration: InputDecoration(
                labelText: 'Diagnosis',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _medicationsController,
              decoration: InputDecoration(
                labelText: 'Medications',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _remarksController,
              decoration: InputDecoration(
                labelText: 'Remarks',
              ),
            ),
            // SizedBox(height: 16.0),
            // RaisedButton(
            //   child: Text('Save'),
            //   onPressed: _savePatientReport,
            // ),
          ],
        ),
      ),
    );
  }
}
