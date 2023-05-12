import 'dart:io';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easypark/provider/login_provider.dart';
import 'package:easypark/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import '../../../utils/constants.dart';
import '../model/login_model.dart';
import '../model/loginAdmin_model.dart';
import '../model/user_data.dart';
import '../utils/helper_functions.dart';
import 'bottom_text.dart';
import 'change_screen_animation.dart';
import 'top_text.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends ConsumerStatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends ConsumerState<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();
//  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  final formKey = GlobalKey<FormState>();
  final userData = UserData();

  File? _image;
  String downloadURL = '';
  XFile? selectedImage;

  Future saveImage() async {
    selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('image');
    String fileName =
        '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(100000)}.jpg';
    Reference referenceImageToUpload = referenceDirImage.child(fileName);
    try {
      await referenceImageToUpload.putFile(File(selectedImage!.path));
      downloadURL = await referenceImageToUpload.getDownloadURL();
    } catch (e) {
      print(e);
    }
    setState(() {
      _image = File(selectedImage!.path);
    });
  }

  Widget inputField(
      String hint, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: Form(
            child: TextFormField(
              controller: controller,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: hint,
                prefixIcon: Icon(iconData),
              ),
              validator: (value) {
                if (hint == 'Email' &&
                    (value == null || value.isEmpty || !value.contains('@'))) {
                  return 'Please enter a valid email address';
                } else if (hint == 'Password' &&
                    (value == null || value.isEmpty || value.length < 6)) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () async {
          try {
            await SignIn(emailController.text, passwordController.text);
            // // ref.read(userRoleProviderRepository.notifier).state =
            // //     userRole.getUserRole();
            ref.read(userRoleProviderRepository.notifier).state =
                userData.getUserRole();
            final value = await ref.read(userRoleProviderRepository);
            String userRole = value.get('role');
            print(userRole);
            if (userRole == 'admin') {
              //return homePageManager = const AdminPanel();
              Navigator.pushNamed(context, 'admin');
            } else if (userRole == 'user') {
              //return homePageManager = ProfilePage();
              Navigator.pushNamed(context, 'home');
            }
            // ignore: use_build_context_synchronously
            //Navigator.pushNamed(context, 'home');
          }
          // try {
          //   await FirebaseAuth.instance.signInWithEmailAndPassword(
          //     email: emailController.text,
          //     password: passwordController.text,
          //   );
          //   ref.read(userRoleProviderRepository.notifier).state =
          //       userData.getUserRole();
          //   final value = await ref.read(userRoleProviderRepository);
          //   String userRole = value.get('role');
          //   print(userRole);
          //   if (userRole == 'admin') {
          //     print('inside admin');
          //     Navigator.pushNamed(context, 'admin');
          //   } else if (userRole == 'user') {
          //     Navigator.pushNamed(context, 'home');
          //   }
          //   // pop the loading circle
          //   Navigator.pop(context);
          // }
          on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              print('No user found for that email.');
            } else if (e.code == 'wrong-password') {
              print('Wrong password provided for that user.');
            }
          }
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          primary: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget SignUPP(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: const Text('User Privacy and Data Use Policy'),
                    content: const Text(
                        'Our Parkinson detection and follow up mobile application ("EasyPark") is designed to help users manage their health and wellbeing. As a provider of a medical app, we take user privacy and data use seriously. This policy outlines how we collect, store, and use user data.\nUser Privacy and Data Use Policy: We collect personal and health information to provide health recommendations, improve the app, and communicate with users. We do not share user data except with consent or for research reasons. We protect user data with encryption and monitoring. Users can access, modify, or delete their data.'),
                    actions: [
                      TextButton(
                        child: const Text('Disagree'),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: const Text('Agree'),
                        onPressed: () async {
                          await SignUp(emailController, passwordController);
                          saveUser(
                              downloadURL,
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              genderController.text,
                              phoneController.text,
                              '1',
                              ageController.text,
                              'user');
                          //controller lazm yet7ol text
                          if (formKey.currentState!.validate()) {
                            const snackBar =
                                SnackBar(content: Text('Submitting form'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          Navigator.pushNamed(context, 'home');
                        },
                      ),
                    ],
                  ));
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: const StadiumBorder(),
          primary: kSecondaryColor,
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'or',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget logos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/facebook.png'),
          const SizedBox(width: 24),
          Image.asset('assets/images/google.png'),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Forgot Password?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: kSecondaryColor,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    emailController.text = '';
    nameController.text = '';
    passwordController.text = '';
    genderController.text = '';
    ageController.text = '';
    phoneController.text = '';

    createAccountContent = [
      inputField('Name', Ionicons.person_outline, nameController),
      inputField('Email', Ionicons.mail_outline, emailController),
      inputField('Password', Ionicons.lock_closed_outline, passwordController),
      inputField('Age', Ionicons.calendar_clear_outline, ageController),
      inputField('Phone Number', Ionicons.call_outline, phoneController),
      inputField('Gender', Ionicons.female_outline, genderController),
      SignUPP('Sign Up'),
      orDivider(),
      logos(),
    ];

    loginContent = [
      inputField('Email', Ionicons.mail_outline, emailController),
      inputField('Password', Ionicons.lock_closed_outline, passwordController),
      loginButton('Log In'),
      forgotPassword(),
    ];

    ChangeScreenAnimation.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = HelperFunctions.wrapWithAnimatedBuilder(
        animation: ChangeScreenAnimation.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangeScreenAnimation.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 84,
          left: 30,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Stack(
            children: [
              SingleChildScrollView(
                // add a single child scroll view
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
                      onTap: () {
                        saveImage();
                      },
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: _image == null
                            ? const AssetImage('assets/images/userS.jpg')
                            : FileImage(_image!) as ImageProvider,
                      ),
                    ),
                    ...createAccountContent,
                  ],
                  // children: createAccountContent,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: BottomText(),
          ),
        ),
      ],
    );
  }
}
