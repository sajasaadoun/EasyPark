import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:easypark/model/spiral_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HandwrittingDetection extends StatefulWidget {
  const HandwrittingDetection({super.key});

  @override
  State<HandwrittingDetection> createState() => _HandwrittingDetectionState();
}

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class _HandwrittingDetectionState extends State<HandwrittingDetection> {
  File? selectedImage;
  String? message = "";
  final SpiralData = SpiralModel();

  File? _image;
  String downloadURL = '';
  // XFile? selecteImage;

  Future saveImageSpiral() async {
    // selecteImage = await ImagePicker().pickImage(source: ImageSource.gallery);
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

  uploadImage() async {
    // var url = "http://192.168.1.3:8000/upload";
    var url = "https://easyparkbackend-production.up.railway.app/uploadSpiral";
    final request = http.MultipartRequest("POST", Uri.parse(url));

    final headers = {"Content-type": "multipart/form-data"};

    request.files.add(http.MultipartFile('image',
        selectedImage!.readAsBytes().asStream(), selectedImage!.lengthSync(),
        filename: selectedImage!.path.split("/").last));

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

  Future getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload The Spiral Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null
                ? const Text("Please pick an image to upload")
                : Image.file(selectedImage!),
            TextButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[600])),
                onPressed: () async {
                  await uploadImage();
                  await saveImageSpiral();
                  SpiralData.addUserResults(userId, downloadURL, message!);
                },
                icon: const Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                label: const Text(
                  "upload",
                  style: TextStyle(color: Colors.white),
                )),
            Text('$message'),

            // SpiralData.addUserResults(userId, downloadURL, message!);
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getImage, child: const Icon(Icons.add_a_photo)),
    );
  }
}
