import 'package:flutter/material.dart';

class PatientReportAr extends StatefulWidget {
  @override
  _PatientReportState createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReportAr> {
  TextEditingController _medicationsController = TextEditingController();

  String _patientName = 'احمد كمال';
  String _age = '65';
  String _diagnosis = 'لديه شلل الرعاش';

  void _savePatientReport() {
    // Save the data entered by the user to a database or file.
    print('Patient Name: $_patientName');
    print('Diagnosis: $_diagnosis');
    print('Age: $_age');
    print('Medications: ${_medicationsController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تقرير حالة المريض'),
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
                  'اسم المريض:',
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
                  'سن المريض:',
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
                  'التشخيص:',
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
                  'الأدوية:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                TextField(
                  controller: _medicationsController,
                  decoration: InputDecoration(
                    hintText: 'أدخل الأدوية إذا لزم الأمر',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            child: Text('حفظ'),
            onPressed: _savePatientReport,
          ),
        ],
      ),
    );
  }
}
