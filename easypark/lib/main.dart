import 'package:easypark/screens/login_page.dart';
import 'package:easypark/screens/register_page.dart';
import 'package:easypark/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/speechDetection.dart';
import 'screens/faceDetection.dart';
import 'screens/question_page.dart';
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
        initialRoute: 'sketch',
        routes: {
          '/': (context) => const HomePage(),
          '/test': (context) => const TestPage(),
          'speech': (context) => const speechPage(),
          // 'face': (context) => const facePage(),
          '/login': (context) => const LoginScreen(),
          'question': (context) => const QuestionsScreen(),
          'doctor': (context) => const DoctorPage(),
          'profile': (context) => ProfilePage(),
          'sketch': (context) => const sketchPage(),
        });
  }
}
