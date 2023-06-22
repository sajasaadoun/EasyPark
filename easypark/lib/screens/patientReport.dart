import 'package:easypark/provider/face_provider.dart';
import 'package:easypark/provider/login_provider.dart';
import 'package:easypark/provider/spiral_provider.dart';
import 'package:easypark/provider/voice_provider.dart';
import 'package:easypark/provider/wave_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientReport extends ConsumerStatefulWidget {
  PatientReport({Key? key});

  @override
  ConsumerState<PatientReport> createState() => _CrudPatientReport();
}

final String diagnosisText = 'Has Parkinson disease';

TextEditingController _medicationsController = TextEditingController();

class _CrudPatientReport extends ConsumerState<PatientReport> {
  late String wavemssg;
  @override
  // void initState() {
  //   final waveRead = ref.read(WaveDataProvider).value;
  //   wavemssg = waveRead.get('message');
  //   print('sojo & bassem');
  //   print(wavemssg);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final waveRead = ref.watch(WaveDataProvider);
    final spiralRead = ref.watch(SpiralDataProvider);
    final faceRead = ref.watch(FaceDataProvider);
    final voiceRead = ref.watch(VoiceDataProvider);
    final userRead = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Report'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home');
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
                userRead.when(
                  data: (value) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: Text(
                          'Patient Name:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        value.get('name'),
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
                       value.get('age'),
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  loading: () => CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
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
                  'diagnosisText',
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
                  'diagnosis',
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
                  spiralRead.when(
                    data: (value) => value.get('message'),
                    loading: () => 'Loading...',
                    error: (error, stackTrace) => 'Error: $error',
                  ),
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
                  waveRead.when(
                    data: (value) => value.get('message'),
                    loading: () => 'Loading...',
                    error: (error, stackTrace) => 'Error: $error',
                  ),
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
                  faceRead.when(
                    data: (value) => value.get('message'),
                    loading: () => 'Loading...',
                    error: (error, stackTrace) => 'Error: $error',
                  ),
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
                  voiceRead.when(
                    data: (value) => value.get('message'),
                    loading: () => 'Loading...',
                    error: (error, stackTrace) => 'Error: $error',
                  ),
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}



// import 'package:easypark/provider/face_provider.dart';
// import 'package:easypark/provider/login_provider.dart';
// import 'package:easypark/provider/spiral_provider.dart';
// import 'package:easypark/provider/voice_provider.dart';
// import 'package:easypark/provider/wave_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class PatientReport extends ConsumerStatefulWidget {
//   PatientReport({Key? key});

//   @override
//   ConsumerState<PatientReport> createState() => _CrudPatientReport();
// }

// final String patientName = 'AHMEDDD Besheer';
// final String age = '56';
// final String diagnosis = 'Parkinson';
// final String diagnosisText = 'Has Parkinson disease';

// TextEditingController _medicationsController = TextEditingController();

// class _CrudPatientReport extends ConsumerState<PatientReport> {
//   @override
//   Widget build(BuildContext context) {
//     final waveRead=ref.watch(WaveDataProvider);
//     final spiralRead=ref.watch(SpiralDataProvider);
//     final faceRead=ref.watch(FaceDataProvider);
//     final voiceRead=ref.watch(VoiceDataProvider);
//      final userRead=ref.watch(userDataProvider);
    
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Report'),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, 'home');
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: 
//       ListView(
//         padding: EdgeInsets.all(16.0),
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.blue,
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
    
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 userData.when(
//                    data: (value) => SafeArea(
//                   child: Text(
//                     'Patient Name:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   patientName,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Patient Age:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   age,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Diagnosis:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   diagnosisText,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Severity Level:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Spiral Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Wave Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Face Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Voice Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Container(
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.blue,
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Medications:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   controller: _medicationsController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter medications if needed',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             child: Text('Save'),
//             onPressed: (){},
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easypark/model/wave_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class PatientReport extends ConsumerStatefulWidget {
//   // final DocumentSnapshot document;
//   // PatientReport(this.document);
//   @override
//   ConsumerState<PatientReport> createState() => _PatientReportState();
// }

// class _PatientReportState extends ConsumerState<PatientReport> {
//   TextEditingController _medicationsController = TextEditingController();
//   String _patientName = 'Amgad Besheer';
//   String _age = '56';
//   String _diagnosis = 'Parkinson';
//   String _Ddiagnosis = 'Has Parkinson disease';

//   void _savePatientReport() {
//     // Save the data entered by the user to a database or file.
//     print('Patient Name: $_patientName');
//     print('Age: $_age');
//     print('Diagnosis: $_diagnosis');
//     print('Severity Level: $_age');
//     print('Spiral Test Result: $_age');
//     print('Wave Test Result: $_age');
//     print('Face Test Result: $_age');
//     print('Voice Test Result: $_age');
//     print('Medications: ${_medicationsController.text}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Report'),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, 'home');
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(16.0),
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.blue,
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Patient Name:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _patientName,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Patient Age:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _age,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Diagnosis:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _Ddiagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Severity Level:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Spiral Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Wave Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Face Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//                 SizedBox(height: 16.0),
//                 Text(
//                   'Voice Test Result:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   _diagnosis,
//                   style: TextStyle(fontSize: 16.0),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Container(
//             padding: EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.blue,
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Medications:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 TextField(
//                   controller: _medicationsController,
//                   decoration: InputDecoration(
//                     hintText: 'Enter medications if needed',
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16.0),
//           ElevatedButton(
//             child: Text('Save'),
//             onPressed: _savePatientReport,
//           ),
//         ],
//       ),
//     );
//   }
// }
