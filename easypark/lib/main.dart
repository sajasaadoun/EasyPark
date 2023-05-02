import 'package:easypark/model/chat_user.dart';
import 'package:easypark/screens/admin_screen.dart';
import 'package:easypark/screens/camera_screen.dart';
import 'package:easypark/screens/chat_bar_screen.dart';
import 'package:easypark/screens/chat_screen.dart';
import 'package:easypark/screens/doctor_info_screen.dart';
import 'package:easypark/screens/handwrittingDetection.dart';
import 'package:easypark/screens/home_page.dart';
import 'package:easypark/screens/login_screen.dart';
import 'package:easypark/screens/options_screen.dart';
import 'package:easypark/screens/register_page.dart';
import 'package:easypark/screens/test_screen.dart';
import 'package:easypark/screens/wave-detection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/data_doctor.dart';
import 'screens/dialog_message.dart';
import 'screens/appointment_screen.dart';
import 'screens/homepage.dart';
// import 'screens/results_schedule_screen.dart';
import 'screens/speechDetection.dart';
import 'screens/faceDetection.dart';
import 'screens/question_model.dart';
import 'screens/doctor_page.dart';
import 'screens/profile_page.dart';
import 'screens/sketch_page.dart';
import 'screens/splash_screen.dart';
import 'widgets/login_content.dart';
//import 'package:firebase_picture_uploader/firebase_picture_uploader.dart';
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
        initialRoute: '/home',
        routes: {
          // '/': (context) => const HomePage(),
          '/home': (context) => const HomePagee(),
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
          'spiral': (context) => const HandwrittingDetection(),
          'waveDetection': (context) => const WaveDetection(),
          'loginn': (context) => const LoginScreen(),
          'camera': (context) => const CameraScreen(),
          'DoctorsInfo': (context) => DoctorInfo(model: staticModel),
          'OptionsScreen': (context) => MyPlansScreen(),
          'MyAlertDialog': (context) => MyAlertDialog(),
          'appoint': (context) => ReserveScreen(),
          'ChatScreen': (context) => ChatScreen(user: staticUser),
          'ChatFirst': (context) => ChatFirst()
        });
  }
}
