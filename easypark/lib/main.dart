import 'package:easypark/screens/OLDadmin_screen.dart';
import 'package:easypark/screens/camera_screen.dart';
import 'package:easypark/screens/doctor_info_screen.dart';
import 'package:easypark/screens/handwrittingDetection.dart';
import 'package:easypark/screens/home_page.dart';
import 'package:easypark/screens/doctorpage.dart';
import 'package:easypark/screens/login_screen.dart';
import 'package:easypark/screens/options_screen.dart';
import 'package:easypark/screens/test_screen.dart';
import 'package:easypark/screens/try.dart';
import 'package:easypark/screens/admin_screen.dart';
import 'package:easypark/screens/wave-detection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/data_doctor.dart';
import 'screens/dialog_message.dart';
// import 'screens/results_schedule_screen.dart';
import 'screens/speechDetection.dart';
import 'screens/faceDetection.dart';
import 'screens/question_model.dart';
import 'screens/OLDdoctor_page.dart';
import 'screens/profile_page.dart';
import 'screens/sketch_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'doctor',
        routes: {
          'try': (context) =>  PatientReport(),
          'admin': (context) =>  AdminPanell(),
         'doctor': (context) => const DoctorPage(),
          '/': (context) => const HomePagee(),
          'speech': (context) => const SpeechPage(),
          'login': (context) => const LoginScreen(),
          'question': (context) => const QuestionsScreen(),
          'profile': (context) => ProfilePage(),
          'sketch': (context) => const sketchPage(),
          'facepg': (context) => const FacePage(),
          'spiral': (context) => const HandwrittingDetection(),
          'waveDetection': (context) => const WaveDetection(),
          'camera': (context) => const CameraScreen(),
          'DoctorsInfo': (context) => DoctorInfo(model: staticModel),
          'OptionsScreen': (context) => MyPlansScreen(),
          'MyAlertDialog': (context) => MyAlertDialog(),
          // 'splash': (context) => Splash()
          // 'test': (context) => const TestPage(),
          // 'admin': (context) => const MyAdmin(),
      
          // 'doctor': (context) => const DoctorPage(),
        });
  }
}
