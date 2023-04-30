import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class WaveDetection extends StatefulWidget {
  const WaveDetection({super.key});

  @override
  State<WaveDetection> createState() => _WaveDetectionState();
}

class _WaveDetectionState extends State<WaveDetection> {
  File? selectedImage;
  String? message = "";

  uploadImage() async {
    var url = "http://192.168.1.5:8000/upload";
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
        title: const Text("Uploading Image to flask server"),
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
                onPressed: () {
                  uploadImage();
                },
                icon: const Icon(
                  Icons.upload_file,
                  color: Colors.white,
                ),
                label: const Text(
                  "upload",
                  style: TextStyle(color: Colors.white),
                )),
            Text('. $message'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: getImage, child: const Icon(Icons.add_a_photo)),
    );
  }
}
