import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easypark/utils/user_preferences.dart';
import 'package:easypark/provider/login_provider.dart';
import '../model/user_model.dart';
import 'package:easypark/widgets/profile_widget.dart';
import 'package:easypark/widgets/textfield_widget.dart';

class EditProfilePage extends StatefulWidget {
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var user = UserPreferences.myUser;
  final userData = UserData();
  // User user = UserPreferences.myUser;
  PlatformFile? pickedFile;
  ImageProvider? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formkey = GlobalKey<FormState>();

//********************uploadfile ***********************/
  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);
    final ref = FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }

//*****************end-upload************* */

//**************Select picture************* */
  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

//****************end-select****************** */
  @override
  Widget build(BuildContext context) {
    //appBar: buildAppBar(context),
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          style: TextStyle(fontSize: 20, color: Colors.white),
          'Edit your profile',
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/ar/home');
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
                key: formkey,
                child: Column(
                  children: [
                    // padding: const EdgeInsets.symmetric(horizontal: 32),

                    const SizedBox(height: 50),
                    if (pickedFile != null)
                      Expanded(
                          child: Container(
                              color: Colors.blue[100],
                              child: Image.file(
                                File(pickedFile!.path!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ))),

                    ProfileWidget(
                      imagePath: user.imagePath,
                      isEdit: true,
                      onClicked: () async {},
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
                      child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                            hintText: 'please Enter your name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "enter a your name";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter your email',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter your Email';
                              } else if (!value.contains('@') ||
                                  value.contains('.')) {
                                return 'please enter a valid Email';
                              }
                              return null;
                            })),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: ageController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Age',
                          hintText: 'Enter your age',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your password';
                          } else if (value.length < 8) {
                            return 'password must be at least 8 characters';
                          }
                          return null;
                        }),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Phone',
                            hintText: 'Enter your phone number',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                              return 'Your phone number should be 11 number';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    // ######################update################################
                    Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ElevatedButton(
                        child: const Text("Update"),
                        onPressed: (() async {
                          if (formkey.currentState!.validate()) {
                            try {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Updated Successfully')),
                              );
                              await userData.updateUserDetails(
                                  nameController.text,
                                  emailController.text,
                                  passwordController.text,
                                  ageController.text,
                                  phoneController.text);
                              Navigator.pushNamed(context, 'edit');
                            } catch (error) {
                              print(
                                  'Error: $error'); // Print the error in the terminal
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'There was an error, Please try again!'),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Correct the mistakes in form.'),
                              ),
                            );
                          }
                          userData.updateUserDetails(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                              ageController.text,
                              phoneController.text);
                        }),
                      ),
                    ),
                    //#######################end-update#######################

                    //##############################delete########################
                    // Container(
                    //   height: 50,
                    //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    //   child: ElevatedButton(
                    //     child: const Text("Delete My account"),
                    //     onPressed: () {
                    //       final docUser = FirebaseFirestore.instance
                    //           .collection('users')
                    //           .doc(userID);

                    //       docUser.delete();
                    //       FirebaseAuth.instance.signOut();
                    //       Navigator.pushNamed(context, 'login');
                    //     },
                    //   ),
                    // ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
