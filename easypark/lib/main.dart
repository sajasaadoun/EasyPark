import 'package:easypark/screens/test_screen.dart';
import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/speechDetection.dart';
import 'screens/faceDetection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'speech',
        //home: Welcome(),
        routes: {
          '/': (context) => const HomePage(),
          '/test': (context) => const TestPage(),
          'speech': (context) => const speechPage(),
          'face': (context) => const facePage(),
        });
  }
}
