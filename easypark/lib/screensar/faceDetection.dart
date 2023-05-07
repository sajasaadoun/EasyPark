import 'dart:convert';
import 'dart:io';
import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class faceDetectionAr extends StatefulWidget {
  const faceDetectionAr({super.key});

  @override
  State<faceDetectionAr> createState() => _faceDetectionState();
}

class _faceDetectionState extends State<faceDetectionAr> {
  File? selectedImage;
  String? message = "";

  uploadImage() async {
    var url = "http://192.168.1.3:8000/upload";
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
        title: const Text("تحميل صور الوجه"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildImagePicker(
                'اختر صورة مبتسمة لك',
                Icons.tag_faces,
                () => getImage(),
              ),
              const SizedBox(height: 16.0),
              _buildImagePicker(
                'اختر صورة وجه مقرف لك',
                Icons.sentiment_very_dissatisfied,
                () => getImage(),
              ),
              const SizedBox(height: 16.0),
              _buildImagePicker(
                'اختر صورة وجه مفاجأة لك',
                Icons.sentiment_very_satisfied,
                () => getImage(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildImagePicker(
      String title, IconData icon, VoidCallback onPressed) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue[600]),
              ),
              onPressed: onPressed,
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              label: const Text(
                'تحميل',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8.0),
            Text('. $message'),
          ],
        ),
      ),
    );
  }
}
