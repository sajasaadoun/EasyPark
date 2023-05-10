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

class EditProfilePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  var user = UserPreferences.myUser;
  final userData = UserData();
  // User user = UserPreferences.myUser;
  PlatformFile? pickedFile;
  ImageProvider? image;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController ageController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState(); // get old value and put it in txtfields
    final watchValue = ref.read(userDataProvider).value;

    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    ageController = TextEditingController();
    phoneController = TextEditingController();
  }

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
  Widget build(BuildContext context) => Scaffold(
        //appBar: buildAppBar(context),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
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
            ElevatedButton(
              onPressed: selectFile,
              child: const Text("select image"),
            ),
            ElevatedButton(
                onPressed: uploadFile, child: const Text("upload image")),
            // ######################update################################
            ElevatedButton(
              child: Text("Update"),
              onPressed: (() {
                userData.updateUserDetails(
                    nameController.text,
                    emailController.text,
                    passwordController.text,
                    ageController.text,
                    phoneController.text);
              }),
            ),
            //#######################end-update#######################

            //##############################delete########################
            ElevatedButton(
              child: const Text("Delete My account"),
              onPressed: () {
                final docUser =
                    FirebaseFirestore.instance.collection('users').doc(userID);

                docUser.update({
                  'firstname': FieldValue.delete(),
                  'lastname': FieldValue.delete(),
                  'email': FieldValue.delete(),
                  'nationality': FieldValue.delete(),
                  'password': FieldValue.delete(),
                  'DateOfBirth': FieldValue.delete(),
                  'role': FieldValue.delete(),
                  'phoneNum': FieldValue.delete(),
                  'id': FieldValue.delete(),
                });
                FirebaseAuth.instance.signOut();
              },
            ),
            //#################################end-delete#############################
            const SizedBox(height: 24),
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter your name',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: ageController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
                hintText: 'Enter your age',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
                hintText: 'Enter your phone number',
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      );
}
//           final userId = user?.uid;

//           // Delete the user's data from Firebase
//          await FirebaseFirestore.instance.collection('users').doc(userId).delete();

//           // Navigate to the login screen
//           Navigator.of(context).pushReplacementNamed('/h');
//               }