import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

// class UserData {
Future SignIn(String email, String password) async {
  final User? user = (await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password))
      .user;

  userId = user!.uid;
}

Future SignUp(String email, String password) async {
  final User? newuser = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password))
      .user;
  CreateUser(newuser!.uid, 'firstname', 'lastname', email, 'DateOfBirth',
      password, 'phoneNum', 'nationality', 'role');
}

Future CreateUser(
    String DOB,
    String email,
    String fname,
    String idd,
    String lname,
    String nationality,
    String password,
    String phone,
    String role) async {
  await FirebaseFirestore.instance.collection('users').doc(idd).set({
    'DateOfBirth': DOB,
    'email': email,
    'firstname': fname,
    'id': idd,
    'lastname': lname,
    'nationality': nationality,
    'password': password,
    'phoneNum': phone,
    'role': role,
  });
}
