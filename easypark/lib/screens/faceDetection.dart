// import 'dart:convert';
// import 'dart:io';
// import 'package:photo_view/photo_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import 'package:http/http.dart' as http;

// class faceDetection extends StatefulWidget {
//   const faceDetection({super.key});

//   @override
//   State<faceDetection> createState() => _faceDetectionState();
// }

// class _faceDetectionState extends State<faceDetection> {
//   File? selectedImage;
//   String? message = "";

//   void uploadImage() async {
//     // Create a list of individual file objects
//     List<File> files =
//         _images.where((image) => image != null).map((image) => image!).toList();

//     // Send the files to the API using a multipart/form-data request
//     var request = http.MultipartRequest(
//         'POST', Uri.parse('http://192.168.1.3:8000/upload'));
//     files.forEach((file) {
//       request.files.add(http.MultipartFile(
//           'images[]', file.readAsBytes().asStream(), file.lengthSync(),
//           filename: basename(file.path)));
//     });

//     // Send the request
//     var response = await request.send();

//     // Handle the response
//     if (response.statusCode == 200) {
//       // Request successful
//     } else {
//       // Request failed
//     }
//   }

//   // Future getImage() async {
//   //   final pickedImage =
//   //       await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   selectedImage = File(pickedImage!.path);
//   //   setState(() {});
//   // }
//   Future<void> getImage(int index) async {
//     final pickedFile =
//         await ImagePicker().getImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _images[index] = File(pickedFile.path);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, 'home');
//           },
//           child: const Icon(
//             Icons.arrow_back_ios,
//             size: 20,
//             color: Colors.white,
//           ),
//         ),
//         title: const Text("Upload The Face Images"),
//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               _buildImagePicker(
//                 'Pick a smiling image of you',
//                 Icons.tag_faces,
//                 () => uploadImage(),
//               ),
//               const SizedBox(height: 16.0),
//               _buildImagePicker(
//                 'Pick a disgusted face image of you',
//                 Icons.sentiment_very_dissatisfied,
//                 () => uploadImage(),
//               ),
//               const SizedBox(height: 16.0),
//               _buildImagePicker(
//                 'Pick a surprised face image of you',
//                 Icons.sentiment_very_satisfied,
//                 () => uploadImage(),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: getImage(3),
//         child: const Icon(Icons.add_a_photo),
//       ),
//     );
//   }

//   List<File?> _images = List.generate(3, (_) => null);

//   Widget _buildImagePicker(String title, IconData icon, int index) {
//     return Column(
//       children: <Widget>[
//         Text(title),
//         IconButton(
//           icon: Icon(icon),
//           onPressed: () => getImage(index),
//         ),
//         _images[index] != null ? Image.file(_images[index]!) : Placeholder(),
//       ],
//     );
//   }

//   // Widget _buildImagePicker(
//   //     String title, IconData icon, VoidCallback onPressed) {
//   //   return Card(
//   //     child: Padding(
//   //       padding: const EdgeInsets.all(16.0),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.stretch,
//   //         children: [
//   //           Text(
//   //             title,
//   //             style: const TextStyle(
//   //               fontSize: 18.0,
//   //               fontWeight: FontWeight.bold,
//   //             ),
//   //           ),
//   //           const SizedBox(height: 16.0),
//   //           ElevatedButton.icon(
//   //             style: ButtonStyle(
//   //               backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
//   //             ),
//   //             onPressed: onPressed,
//   //             icon: Icon(
//   //               icon,
//   //               color: Colors.white,
//   //             ),
//   //             label: const Text(
//   //               'Upload',
//   //               style: TextStyle(color: Colors.white),
//   //             ),
//   //           ),
//   //           const SizedBox(height: 8.0),
//   //           Text('. $message'),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
// }
