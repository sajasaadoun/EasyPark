import 'dart:io';
import 'dart:math';

import 'package:easypark/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import '../../../utils/constants.dart';
import '../model/login_model.dart';
import '../utils/helper_functions.dart';
import 'bottom_textar.dart';
import 'change_screen_animation.dart';
import 'top_textar.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final genderController = TextEditingController();
  final phoneController = TextEditingController();
  final ageController = TextEditingController();

  final formKey = GlobalKey<FormState>();

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
            Navigator.pushNamed(context, '/ar/home');
          } on FirebaseAuthException catch (e) {
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
                    title:
                        const Text('سياسة خصوصية المستخدم واستخدام البيانات'),
                    content: const Text(
                        'تم تصميم تطبيق الهاتف المحمول الخاص بنا لاكتشاف مرض باركنسون ومتابعته ("EasyPark") لمساعدة المستخدمين على إدارة صحتهم وعافيتهم. بصفتنا مقدمًا لتطبيق طبي ، فإننا نأخذ خصوصية المستخدم واستخدام البيانات على محمل الجد. توضح هذه السياسة كيفية جمع بيانات المستخدم وتخزينها واستخدامها.\nسياسة خصوصية المستخدم واستخدام البيانات: نقوم بجمع المعلومات الشخصية والصحية لتقديم توصيات صحية ، وتحسين التطبيق ، والتواصل مع المستخدمين. نحن لا نشارك بيانات المستخدم إلا بموافقة أو لأسباب بحثية. نحمي بيانات المستخدم بالتشفير والمراقبة. يمكن للمستخدمين الوصول إلى بياناتهم أو تعديلها أو حذفها.'),
                    actions: [
                      TextButton(
                        child: const Text('Agreed'),
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
                          Navigator.pushNamed(context, '/ar/home');
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
              'او',
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
          'نسيت كلمة المرور؟',
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
      inputField('الاسم', Ionicons.person_outline, nameController),
      inputField('البريد الالكتروني', Ionicons.mail_outline, emailController),
      inputField(
          'كلمة المرور', Ionicons.lock_closed_outline, passwordController),
      inputField('العمر', Ionicons.calendar_clear_outline, ageController),
      inputField('رقم التيلفون', Ionicons.call_outline, phoneController),
      inputField('الجنس', Ionicons.female_outline, genderController),
      SignUPP('انشاء حساب'),
      orDivider(),
      logos(),
    ];

    loginContent = [
      inputField('البريد الالكنروني', Ionicons.mail_outline, emailController),
      inputField(
          'كلمة المرور', Ionicons.lock_closed_outline, passwordController),
      loginButton('تسجيل دخول'),
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
          top: 45,
          left: 30,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
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
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        ),
      ],
    );
  }
}
