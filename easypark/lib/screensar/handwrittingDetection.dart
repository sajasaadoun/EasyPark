import 'dart:convert';
import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HandwrittingDetectionAr extends StatefulWidget {
  const HandwrittingDetectionAr({super.key});

  @override
  State<HandwrittingDetectionAr> createState() => _HandwrittingDetectionState();
}

class _HandwrittingDetectionState extends State<HandwrittingDetectionAr> {
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
        title: const Text("قم بتحميل الصورة "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            selectedImage == null
                ? const Text("الرجاء اختيار صورة لتحميلها")
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
                  "رفع الصورة",
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
