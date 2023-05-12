import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../model/wave_model.dart';

class Face extends StatefulWidget {
  const Face({Key? key}) : super(key: key);
  @override
  State<Face> createState() => _FaceState();
}

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class _FaceState extends State<Face> {
  List<File?> selectedImages = List.filled(3, null);
  String? message = "";

  final WaveData = WaveModel();

  List<File?> _images = List.filled(3, null);
  List<String> downloadURLs = [];

  Future<void> saveImageWave(File? imageFile) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('image');
    String fileName =
        '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(100000)}.jpg';
    Reference referenceImageToUpload = referenceDirImage.child(fileName);
    try {
      await referenceImageToUpload.putFile(imageFile!);
      String downloadURL = await referenceImageToUpload.getDownloadURL();
      downloadURLs.add(downloadURL);
    } catch (e) {
      print(e);
    }
  }

  // Future<void> uploadImages() async {
  //   var url = "http://192.168.1.11:8000/upload";
  //   final request = http.MultipartRequest("POST", Uri.parse(url));

  //   final headers = {"Content-type": "multipart/form-data"};
  //   List<String> imagePaths = []; // Create a list of image paths

  //   for (int i = 0; i < 3; i++) {
  //     if (selectedImages[i] != null) {
  //       request.files.add(http.MultipartFile(
  //           'image$i',
  //           selectedImages[i]!.readAsBytes().asStream(),
  //           selectedImages[i]!.lengthSync(),
  //           filename: basename(selectedImages[i]!.path)));
  //       // Add the image path to the list
  //       imagePaths.add(selectedImages[i]!.path);
  //     }
  //   }

  //   // request.headers.addAll(headers);
  //   request.fields['image_paths'] = jsonEncode(imagePaths);
  //   final response = await request.send();
  //   http.Response res = await http.Response.fromStream(response);
  //   if (response.statusCode == 200) {http://192.168.1.16:8000
  //     final resJson = jsonDecode(res.body);
  //     message = resJson['message'].toString();
  //     setState(() {});
  //     print('here');
  //   } else {
  //     print('Failed ${response.statusCode}');
  //     message = 'failed';
  //   }
  // }

  Future<void> uploadImages() async {
    var url = "http://192.168.1.3:8000/upload";
    final request = http.MultipartRequest("POST", Uri.parse(url));

    final headers = {"Content-type": "multipart/form-data"};
    List<String> imagePaths = []; // Create a list of image paths

    for (int i = 0; i < 3; i++) {
      if (selectedImages[i] != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'image_paths',
            selectedImages[i]!
                .path)); // Use 'image_paths' as the form field name
        // Add the image path to the list
        imagePaths.add(selectedImages[i]!.path);
      }
    }

    // Add the image paths to the request
    request.fields['image_paths'] = json.encode(imagePaths);

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // Request successful
        final responseString = await response.stream.bytesToString();
        print(responseString);
      } else {
        // Request failed
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Error occurred during request
      print('Error uploading images: $e');
    }
  }

  Future<void> getImages() async {
    List<File?> pickedImages = [];
    for (var i = 0; i < 3; i++) {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        pickedImages.add(File(pickedImage.path));
      }
    }
    selectedImages = pickedImages;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Your Face Images"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              selectedImages[0] == null &&
                      selectedImages[1] == null &&
                      selectedImages[2] == null
                  ? const Text("Please pick 3 images to upload")
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          if (selectedImages[0] != null)
                            Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(selectedImages[0]!),
                                ),
                              ),
                            ),
                          if (selectedImages[1] != null)
                            Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(selectedImages[1]!),
                                ),
                              ),
                            ),
                          if (selectedImages[2] != null)
                            Container(
                              width: 150,
                              height: 150,
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(selectedImages[2]!),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
              ElevatedButton(
                onPressed: getImages,
                child: const Text("Pick Images"),
              ),
              ElevatedButton(
                onPressed: selectedImages[0] != null &&
                        selectedImages[1] != null &&
                        selectedImages[2] != null
                    ? () async {
                        for (int i = 0; i < 3; i++) {
                          await saveImageWave(selectedImages[i]);
                        }
                        await uploadImages();
                      }
                    : null,
                child: const Text("Upload Images"),
              ),
              if (message != null) Text(message!),
            ],
          ),
        ),
      ),
    );
  }
}
