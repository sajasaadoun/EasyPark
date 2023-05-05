import 'dart:io';
import 'package:easypark/apis/uploadfile_api.dart';
import 'package:easypark/widgets/uploadbutton_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class facePage extends StatelessWidget {
  static final String title = 'Face Image Detection';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  UploadTask? task;
  File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        title: Text(facePage.title),
        centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'home');
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UploadButtonWidget(
                  text: 'Upload a smiling image',
                  icon: Icons.attach_file,
                  onClicked: selectFile,
                ),
                SizedBox(height: 15),
                UploadButtonWidget(
                  text: 'Upload a disgusted image',
                  icon: Icons.attach_file,
                  onClicked: selectFile,
                ),
                SizedBox(height: 15),
                UploadButtonWidget(
                  text: 'Upload a surprised image',
                  icon: Icons.attach_file,
                  onClicked: selectFile,
                ),
                SizedBox(height: 15),
                Text(
                  fileName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 48),
                UploadButtonWidget(
                  text: 'Upload File',
                  icon: Icons.cloud_upload_outlined,
                  onClicked: uploadFile,
                ),
                SizedBox(height: 20),
                task != null ? buildUploadStatus(task!) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName';

    task = UploadFileApi.uploadFile(destination, file!);
    setState(() {});

    if (task == null) return;

    final snapshot = await task!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }

  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
        stream: task.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final snap = snapshot.data!;
            final progress = snap.bytesTransferred / snap.totalBytes;
            final percentage = (progress * 100).toStringAsFixed(2);

            return Text(
              '$percentage %',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          } else {
            return Container();
          }
        },
      );
}

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';

// class FacePage extends StatefulWidget {
//   const FacePage({super.key});

//   @override
//   State<FacePage> createState() => _FacePageState();
// }

// class _FacePageState extends State<FacePage> {
//   // File? selectedImage;
//   // String? message = "";

//   // Future getImage() async {
//   //   final pickedImage =
//   //       await ImagePicker().getImage(source: ImageSource.gallery);
//   //   selectedImage = File(pickedImage!.path);
//   //   setState(() {});
//   // }

//   List<String> str = [
//     "Click on the Upload button",
//     "Choose the photo of your drawing ",
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       // ignore: prefer_const_literals_to_create_immutables
//       bottomNavigationBar: BottomNavigationBar(items: [
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: '',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.message),
//           label: '',
//         ),
//         const BottomNavigationBarItem(
//           icon: Icon(Icons.arrow_circle_left),
//           label: '',
//         )
//       ]),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25.0),
//               // ignore: prefer_const_literals_to_create_immutables
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: const [
//                       Padding(
//                         padding: EdgeInsets.only(top: 17.0),
//                         child: Text(
//                           'Hello,',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 18,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'EasyPark Patient',
//                         style: TextStyle(fontSize: 20),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.deepPurple[100],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Icon(Icons.person),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text('Upload Image'),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(5),
//               child: Row(
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [
//                   const Text(
//                     'Instructions',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 25),
//               decoration: BoxDecoration(
//                   color: Colors.pink[100],
//                   borderRadius: BorderRadius.circular(20)),
//               child: Column(
//                 children: str.map((strone) {
//                   return Row(children: [
//                     const Text(
//                       "\u2022",
//                       style: TextStyle(fontSize: 15),
//                     ), //bullet text
//                     const SizedBox(
//                       width: 10,
//                     ), //space between bullet and text
//                     Expanded(
//                       child: Text(
//                         strone,
//                         style: const TextStyle(fontSize: 15),
//                       ), //text
//                     )
//                   ]);
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //elevated button in container?  