import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

// import '../model/wave_model.dart';

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

  // final WaveData = WaveModel();

  List<File?> _images = List.filled(3, null);
  List<String> downloadURLs = [];

  Future saveImageWave(File? selectedImage) async {
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImage = referenceRoot.child('image');
    String fileName =
        '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(100000)}.jpg';
    Reference referenceImageToUpload = referenceDirImage.child(fileName);
    try {
      await referenceImageToUpload.putFile(File(selectedImage!.path));
      downloadURLs.add(await referenceImageToUpload.getDownloadURL());
    } catch (e) {
      print(e);
    }
  }

  uploadImages() async {
    var url = "http://192.168.1.3:8000/upload";
    final request = http.MultipartRequest("POST", Uri.parse(url));

    final headers = {"Content-type": "multipart/form-data"};

    for (var i = 0; i < 3; i++) {
      if (selectedImages[i] != null) {
        request.files.add(http.MultipartFile(
            'image$i',
            selectedImages[i]!.readAsBytes().asStream(),
            selectedImages[i]!.lengthSync(),
            filename: selectedImages[i]!.path.split("/").last));
      }
    }

    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      final resJson = jsonDecode(res.body);
      message = resJson['message'].toString();
      setState(() {});
      print('here');
    } else {
      print('Failed ${response.statusCode}');
      message = 'failed';
    }
  }

  Future getImages() async {
    List<File?> pickedImages = [];
    for (var i = 0; i < 3; i++) {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      pickedImages.add(File(pickedImage!.path));
    }
    selectedImages = pickedImages;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload The Wave Images"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImages[0] == null &&
                    selectedImages[1] == null &&
                    selectedImages[2] == null
                ? const Text("Please pick 3 images to upload")
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      selectedImages[0] != null
                          ? Image.file(selectedImages[0]!)
                          : SizedBox(),
                      selectedImages[1] != null
                          ? Image.file(selectedImages[1]!)
                          : SizedBox(),
                      selectedImages[2] != null
                          ? Image.file(selectedImages[2]!)
                          : SizedBox(),
                    ],
                  ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: getImages,
              child: const Text("Pick Images"),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                for (var i = 0; i < 3; i++) {
                  if (selectedImages[i] != null) {
                    await saveImageWave(selectedImages[i]);
                  }
                }
                await uploadImages();
              },
              child: const Text("Upload Images"),
            ),
            SizedBox(height: 30),
            message != null ? Text(message!) : SizedBox(),
          ],
        ),
      ),
    );
  }
}