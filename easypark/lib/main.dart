import 'package:easypark/model/chat_user.dart';
import 'package:easypark/screens/ProfileScreen.dart';
import 'package:easypark/screens/admin_screen.dart';

import 'package:easypark/screens/addDoctorForm.dart';

// import 'package:easypark/screens/OLDadmin_screen.dart';
import 'package:easypark/model/chat_user.dart';

import 'package:easypark/screens/camera_screen.dart';
import 'package:easypark/screens/chat_bar_screen.dart';
import 'package:easypark/screens/chat_screen.dart';
import 'package:easypark/screens/profilefinal.dart';
import 'package:easypark/screens/profilepage%202.dart';

import 'package:easypark/screensar/homepage.dart';

import 'screens/appointment_screen.dart';
import 'package:easypark/screens/admin_screen.dart';
import 'package:easypark/screens/addDoctorForm.dart';
import 'package:easypark/screens/camera_screen.dart';
import 'package:easypark/screens/doctor_info_screen.dart';
import 'package:easypark/screens/handwrittingDetection.dart';
import 'package:easypark/screens/home_page.dart';
import 'package:easypark/screens/doctorpage.dart';
import 'package:easypark/screens/login_screen.dart';
import 'package:easypark/screens/options_screen.dart';
import 'package:easypark/screens/register_page.dart';
import 'package:easypark/screens/test_screen.dart';
import 'package:easypark/screens/patientReport.dart';
import 'package:easypark/screens/uploadfiles.dart';
import 'package:easypark/screens/wave-detection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model/data_doctor.dart';
import 'screens/dialog_message.dart';
// import 'screens/results_schedule_screen.dart';
import 'screens/speechDetection.dart';
import 'screens/faceDetection.dart';
import 'screens/question_model.dart';
// import 'screens/OLDdoctor_page.dart';
import 'screens/profile_page.dart';
import 'screens/sketch_page.dart';
import 'screens/splash_screen.dart';
import 'widgets/login_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easypark/screens/questionnaire_screen.dart';
import 'package:easypark/screensar/home_page.dart';
import 'package:easypark/screensar/questionnaire_screenAR.dart';
import 'package:easypark/screensar/options_screen.dart';
import 'package:easypark/screensar/patientReport.dart';
import 'package:easypark/screensar/admin_screen.dart';
import 'package:easypark/screensar/addDoctorForm.dart';
import 'package:easypark/screensar/doctorpage.dart';
import 'screensar/doctor_page.dart';
import 'screensar/speechDetection.dart';
import 'package:easypark/screensar/handwrittingDetection.dart';
import 'package:easypark/opening.dart';

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
        initialRoute: '/profile',
        routes: {
          'upload': (context) => uploadfile(),
          'report': (context) => PatientReport(),
          '/profile': (context) => profilescreen(),
          //Profile': (context) => profile(),
          'admin': (context) => AdminPanell(),
          'form': (context) => DoctorForm(),
          'report': (context) => PatientReport(),
          'admin': (context) => const AdminPanell(),
          'form': (context) => const DoctorForm(),

          'doctor': (context) => const DoctorPage(),
          'home': (context) => const HomePagee(),
          '/': (context) => const OpeningPage(),
          '/homeDoctor': (context) => const HomePage(),
          'appoint': (context) => ReserveScreen(),
          'ChatScreen': (context) => ChatScreen(user: staticUser),
          'ChatFirst': (context) => const ChatFirst(),
          'test': (context) => const TestPage(),
          // 'speech': (context) => (),
          'login': (context) => const LoginScreen(),
          'question': (context) => const QuestionsScreen(),
          //'profile': (context) => ProfilePage(),
          'sketch': (context) => const sketchPage(),
          'facepg': (context) => const FacePage(),
          'spiral': (context) => const HandwrittingDetection(),
          'waveDetection': (context) => const WaveDetection(),
          'camera': (context) => const CameraScreen(),
          'DoctorsInfo': (context) => DoctorInfo(),
          'OptionsScreen': (context) => MyPlansScreen(),
          'MyAlertDialog': (context) => MyAlertDialog(),
          'appoint': (context) => ReserveScreen(),
          'ChatScreen': (context) => ChatScreen(user: staticUser),
          'ChatFirst': (context) => ChatFirst(),
          // 'splash': (context) => Splash()
          // 'test': (context) => const TestPage(),
          'questionnaire': (context) => questionnaireScreen(),
          'register': (context) => const RegisterScreen(),
          '/ar/home': (context) => const HomePageeAr(),
          '/ar/quiz': (context) => const questionnaireScreenAr(),
          '/ar/OptionsScreen': (context) => MyPlansScreenAr(),
          //'/ar/doctor': (context) => const DoctorPageAr(),
          '/ar/speech': (context) => const SpeechPageAr(),
          '/ar/spiral': (context) => const HandwrittingDetectionAr(),
          '/ar/report': (context) => PatientReportAr(),
          '/ar/admin': (context) => const AdminPanellAr(),
          '/ar/form': (context) => const DoctorFormAr(),
          '/ar/doctor': (context) => const DoctorPageArr(),
          // 'loginn': (context) => const LoginScreen(),

          // 'test': (context) => const TestPage(),
          // 'speech': (context) => const SpeechPage(),
          // 'face': (context) => const FacePage(),
          // 'login': (context) => const LoginScreen(),
          // 'question': (context) => const QuestionsScreen(),
          // 'doctor': (context) => const DoctorPage(),
          // 'profile': (context) => ProfilePage(),
          // 'sketch': (context) => const sketchPage(),
          // 'admin': (context) => const MyAdmin(),
          // 'facepg': (context) => const FacePage(),
          // 'spiral': (context) => const HandwrittingDetection(),
          // 'waveDetection': (context) => const WaveDetection(),
          // 'camera': (context) => const CameraScreen(),
          // 'DoctorsInfo': (context) => DoctorInfo(model: staticModel),
          // 'OptionsScreen': (context) => MyPlansScreen(),
          // 'MyAlertDialog': (context) => MyAlertDialog(),
          //'splash': (context) => Splash()
        });
  }
}
