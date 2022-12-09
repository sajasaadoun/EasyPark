import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'speechDetection.dart';

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
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          'speech': (context) => speechPage(),
        });
  }
}
