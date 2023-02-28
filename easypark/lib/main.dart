import 'package:easypark/screens/admin_screen.dart';
import 'package:easypark/screens/handwrittingDetection.dart';
import 'package:easypark/screens/login_page.dart';
import 'package:easypark/screens/register_page.dart';
import 'package:easypark/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/speechDetection.dart';
import 'screens/faceDetection.dart';
import 'screens/question_model.dart';
import 'screens/doctor_page.dart';
import 'screens/profile_page.dart';
import 'screens/sketch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'spiralwave',
        routes: {
          '/': (context) => const HomePage(),
          'test': (context) => const TestPage(),
          'speech': (context) => const SpeechPage(),
          'face': (context) => const FacePage(),
          'login': (context) => const LoginScreen(),
          'question': (context) => const QuestionsScreen(),
          'doctor': (context) => const DoctorPage(),
          'profile': (context) => ProfilePage(),
          'sketch': (context) => const sketchPage(),
          'admin': (context) => const MyAdmin(),
          'facepg': (context) => const FacePage(),
          'spiralwave': (context) => const HandwrittingDetection()
        });
  }
}
