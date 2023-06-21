import 'package:easypark/model/chat_user.dart';
import 'package:easypark/screens/DRinsert_question.dart';
import 'package:easypark/screens/FinalResult.dart';
import 'package:easypark/screens/admin_screen.dart';
import 'package:easypark/screens/addDoctorForm.dart';
import 'package:easypark/screens/booking_screen.dart';
import 'package:easypark/screens/camera_screen.dart';
import 'package:easypark/screens/chat_bar_screen.dart';
import 'package:easypark/screens/chat_home_screen.dart';
import 'package:easypark/screens/chat_screen.dart';
import 'package:easypark/screens/edit_profile_page.dart';
import 'package:easypark/screens/delete_doctor.dart';
import 'package:easypark/screens/face2.dart';
// import 'package:easypark/screens/facetest.dart';
import 'package:easypark/screens/patientReport.dart';
import 'package:easypark/screens/record.dart';
import 'package:easypark/screens/profilefinal.dart';
import 'package:easypark/screens/upload-file-W.dart';
import 'package:easypark/screens/upload-file-WS.dart';
import 'package:easypark/screensar/DRinsert_questionAR.dart';
import 'package:easypark/screensar/profilepageEN.dart';
import 'model/myAppointmentList.dart';
import 'screens/appointment_screen.dart';
import 'package:easypark/screens/doctor_info_screen.dart';
import 'package:easypark/screens/handwrittingDetection.dart';
import 'package:easypark/screens/home_page.dart';
import 'package:easypark/screens/doctorpage.dart';
import 'package:easypark/screens/login_screen.dart';
import 'package:easypark/screens/options_screen.dart';
import 'package:easypark/screens/wave-detection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/dialog_message.dart';
import 'screens/insert_question.dart';
import 'screens/questionnaire_screen.dart';
import 'screens/my_appointments_screen.dart';
import 'screens/speechDetection.dart';
import 'model/question_DB.dart';
import 'screens/sketch_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easypark/screensar/home_page.dart';
import 'package:easypark/screensar/options_screen.dart';
import 'package:easypark/screensar/patientReport.dart';
import 'package:easypark/screensar/admin_screen.dart';
import 'package:easypark/screensar/addDoctorForm.dart';
import 'package:easypark/screensar/doctorpage.dart';
import 'package:easypark/screensar/question_model.dart';
import 'package:easypark/screensar/doctor_info_screen.dart';
import 'screensar/speechDetection.dart';
import 'package:easypark/screensar/login_screen.dart';
import 'package:easypark/screensar/faceDetection.dart';
import 'package:easypark/screensar/upload-file-W.dart';
import 'package:easypark/screensar/upload-file-WS.dart';
import 'package:easypark/screensar/handwrittingDetection.dart';
import 'package:easypark/screensar/my_appointments_screen.dart';
import 'package:easypark/screensar/delete_doctor.dart';
import 'package:easypark/screensar/Addquestionsss.dart';
import 'package:easypark/screensar/questionnaire_firebase.dart';
import 'package:easypark/screensar/insert_questionAR.dart';
import 'package:easypark/screens/questionnaire_firebase.dart';
import 'package:easypark/opening.dart';
import 'package:easypark/screens/voice_ui.dart';

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
        initialRoute: 'login',
        routes: {
          // 'ResultPage': (context) =>  ResultPage(),
          'voiceUI': (context) => const AudioPage(),
          '/ar/home': (context) => const HomePageeAr(),
          'report': (context) => PatientReport(),
          'face': (context) => Face(),
          // 'face': (context) => FaceTest(),
          '/ar/question': (context) => const QuestionsScreenAr(),
          '/ar/OptionsScreen': (context) => MyPlansScreenAr(),
          '/ar/speech': (context) => const SpeechPageAr(),
          '/ar/facepg': (context) => const faceDetectionAr(),
          '/ar/spiral': (context) => const HandwrittingDetectionAr(),
          '/ar/report': (context) => PatientReportAr(),
          '/ar/admin': (context) => const AdminPanellAr(),
          '/ar/form': (context) => const DoctorFormAr(),
          '/ar/doctor': (context) => const DoctorPageArr(),
          '/ar/uploadFileWS': (context) => uploadFileWSAr(),
          '/ar/uploadFileW': (context) => uploadFileWAr(),
          'profile': (context) => profilescreenEN(),
          '/ar/DoctorsInfo': (context) => DoctorInfoAr(),
          '/ar/login': (context) => const LoginScreenAr(),
          // '/ar/BookingScreen': (context) => const BookingScreenAr(doctor: 'staticModel'),
          '/ar/MyAppointments': (context) => MyAppointmentsAr(),
          'myappoinment': (context) => MyAppointments(),
          '/ar/deleteDr': (context) => deleteDoctorAr(),
          '/ar/addQuestions': (context) => const AddQuestionsAr(),
          '/ar/questionTest': (context) => const QuestionnaireDbAr(),

          // '/ar/insertQuestions': (context) => const InsertData(),
          'questionTest': (context) => const QuestionnaireDb(),
          // 'insertQuestions': (context) => const InsertData(),
          '/ar/insertQuestions': (context) => const InsertDataAR(),
          'insertQuestions': (context) => const InsertData(),
          'DRInsertDataAR': (context) => const DRInsertDataAR(),
          'DRInsertData': (context) => const DRInsertData(),
          'DoctorsInfo': (context) => DoctorInfo(),
          'OptionsScreen': (context) => MyPlansScreen(),
          'MyAlertDialog': (context) => MyAlertDialog(),
          'appoint': (context) => ReserveScreen(),
          // 'ChatScreen': (context) => ChatScreen(user: staticUser),
          // 'ChatScreen2': (context) => ChatHomeScreen(user: staticUser),
          'ChatFirst': (context) => const ChatFirst(),
          'uploadFileWS': (context) => uploadFileWS(),
          'uploadFileW': (context) => uploadFileW(),
          //'ChatScreen': (context) => ChatScreen(user: staticUser),

          // 'BookingScreen': (context) => BookingScreen(doctor: 'staticModel'),
          'BookingScreen': (context) =>
              const BookingScreen(doctor: 'staticModel'),
          'MyAppointmentList': (context) => MyAppointmentList(),

          // 'addquestion': (context) => AddQuestions(),
          // 'insertQuestions': (context) => const InsertData(),
          'record': (context) => recordPage(),
          'addDrEng': (context) => DoctorForm(),

          'edit': (context) => EditProfilePage(),
          'profile': (context) => profilescreen(),
          'deleteDr': (context) => deleteDoctor(),
          'admin': (context) => const AdminPanell(),
          'doctor': (context) => const DoctorPage(),

          '/': (context) => const OpeningPage(),
          'appoint': (context) => ReserveScreen(),
          //'ChatScreen': (context) => ChatScreen(user: staticUser),
          'ChatFirst': (context) => const ChatFirst(),
          'speech': (context) => const SpeechPage(),
          'login': (context) => const LoginScreen(),
          'question': (context) => const QuestionnaireScreen(),
          //  'AppointScreen': (context) => AppointScreen(),
          'sketch': (context) => const sketchPage(),
          // 'facepg': (context) => faceDetection(),
          'spiral': (context) => const HandwrittingDetection(),
          'waveDetection': (context) => const WaveDetection(),
          'camera': (context) => const CameraScreen(),
          'DoctorsInfo': (context) => DoctorInfo(),
          // 'OptionsScreen': (context) => MyPlansScreen(),
          // 'MyAlertDialog': (context) => MyAlertDialog(),
          // 'appoint': (context) => ReserveScreen(),
          // 'ChatScreen': (context) => ChatScreen(user: staticUser),
          // 'ChatFirst': (context) => const ChatFirst(),
          // 'uploadFileWS': (context) => uploadFileWS(),
          // 'uploadFileW': (context) => uploadFileW(),
          // 'BookingScreen': (context) => BookingScreen(
          //       doctor: 'staticModel',
          //     ),
          // 'MyAppointmentList': (context) => MyAppointmentList(),
          // 'profilescreen': (context) => profilescreen(),
          // // 'SearchList': (context) => SearchList(),
          'MyAppointments': (context) => MyAppointments(),
          'questionnaire': (context) => questionnaireScreen(),
          // 'register': (context) => const RegisterScreen(),

          // '/ar/home': (context) => const HomePageeAr(),
          // '/ar/quiz': (context) => const questionnaireScreenAr(),
          // '/ar/question': (context) => const QuestionsScreenAr(),
          // '/ar/OptionsScreen': (context) => MyPlansScreenAr(),
          // '/ar/speech': (context) => const SpeechPageAr(),
          // '/ar/facepg': (context) => const faceDetectionAr(),
          // '/ar/spiral': (context) => const HandwrittingDetectionAr(),
          // '/ar/report': (context) => PatientReportAr(),
          // '/ar/admin': (context) => const AdminPanellAr(),
          // '/ar/form': (context) => const DoctorFormAr(),
          // '/ar/doctor': (context) => const DoctorPageArr(),
          // '/ar/uploadFileWS': (context) => uploadFileWSAr(),
          // '/ar/uploadFileW': (context) => uploadFileWAr(),
          // '/ar/DoctorsInfo': (context) => DoctorInfoAr(),
          // '/ar/login': (context) => const LoginScreenAr(),
          // // '/ar/BookingScreen': (context) => const BookingScreenAr(doctor: 'staticModel'),
          // '/ar/MyAppointments': (context) => MyAppointmentsAr(),
          // '/ar/deleteDr': (context) => deleteDoctorAr(),
          // '/ar/addQuestions': (context) => const AddQuestionsAr(),
          //////'report': (context) => PatientReport(),
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
