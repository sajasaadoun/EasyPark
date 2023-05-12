import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
//import '../model/wave_model.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();
}

final user = FirebaseAuth.instance.currentUser!;
String userId = user.uid;

class _AudioPageState extends State<AudioPage> {
  File? selectedAudio;
  String? message = "";

  //final WaveData = WaveModel();

  List<File?> _audios = List.filled(1, null);
  List<String> downloadURLs = [];

  // Future<void> saveAudioWave(File? audioFile) async {
  //   Reference referenceRoot = FirebaseStorage.instance.ref();
  //   Reference referenceDirAudio = referenceRoot.child('audio');
  //   String fileName =
  //       '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(100000)}.mp3';
  //   Reference referenceAudioToUpload = referenceDirAudio.child(fileName);
  //   try {
  //     await referenceAudioToUpload.putFile(audioFile!);
  //     String downloadURL = await referenceAudioToUpload.getDownloadURL();
  //     downloadURLs.add(downloadURL);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // uploadAudio() async {
  //   var url = "http://10.1.0.41:8000/upload";
  //   //var url = "http://127.0.0.1:8000/upload";
  //   final request = http.MultipartRequest("POST", Uri.parse(url));

  //   final headers = {"Content-type": "multipart/form-data"};

  //   if (selectedAudio != null) {
  //     request.files.add(http.MultipartFile('audio_path',
  //         selectedAudio!.readAsBytes().asStream(), selectedAudio!.lengthSync(),
  //         filename: selectedAudio!.path.split("/").last));
  //     print(
  //         'selectedAudio Inside if !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  //   }

  //   try {
  //     print('inside try');
  //     final response = await request.send();
  //     // http.Response res = await http.Response.fromStream(response);

  //     if (response.statusCode == 200) {
  //       // Request successful
  //       print('connection success');
  //       final responseString = await response.stream.bytesToString();
  //       print(responseString);
  //       print('responseString !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
  //     } else {
  //       // Request failed
  //       print('Request failed with status: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Error occurred during request
  //     print('Error uploading audio file: $e');
  //   }
  //   request.files.add(http.MultipartFile('audio_path',
  //       selectedAudio!.readAsBytes().asStream(), selectedAudio!.lengthSync(),
  //       filename: selectedAudio!.path.split("/").last));

  //   request.headers.addAll(headers);
  //   final response = await request.send();
  //   http.Response res = await http.Response.fromStream(response);
  //   if (response.statusCode == 200) {
  //     final resJson = jsonDecode(res.body);
  //     message = resJson['message'].toString();
  //     setState(() {});
  //     print('here');
  //   } else {
  //     print('Failed ${response.statusCode}');
  //     message = 'failed';
  //   }
  // }

  // Future sendAudioToBackend(String audioFilePath) async {
  //   final fileBytes = await File(audioFilePath).readAsBytes();
  //   final base64Audio = base64Encode(fileBytes);
  //   var url = "http://10.1.0.41:8000/upload";
  //   final response = http.post(
  //     Uri.parse(url),
  //     body: {'audio': base64Audio},
  //   );
  //   //final response = await request.send();
  //   final httpResponse = response as http.Response;

  //   if (httpResponse.statusCode == 200) {
  //     final json = jsonDecode(httpResponse.body);
  //     return json;
  //   } else {
  //     throw Exception('Failed to load data from API');
  //   }
  //   // Handle the response from the backend
  // }

  Future sendAudioToBackend(File audioFilePath) async {
    // final file = File(audioFilePath);
    final fileBytes = await audioFilePath.readAsBytes();
    final base64Audio = base64Encode(fileBytes);
    var url = "http://192.168.1.2:8000/upload";
    final response = await http.post(
      Uri.parse(url),
      body: {'audio': base64Audio},
    );

    final httpResponse = response as http.Response;

    if (httpResponse.statusCode == 200) {
      print('success!!!!!!!!!!!!!!!!');
      final json = jsonDecode(httpResponse.body);
      message = json['message'].toString();
      setState(() {});
      print(json);
      return json;
    } else {
      throw Exception('Failed to load data from API');
    }
    // Handle the response from the backend
  }

  Future<void> getAudio() async {
    FilePickerResult? pickedAudio = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: false,
    );
    if (pickedAudio != null && pickedAudio.files.isNotEmpty) {
      selectedAudio = File(pickedAudio.files.first.path!);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload The Wave Audio"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              selectedAudio == null
                  ? const Text("Please pick an audio file")
                  : Container(
                      width: 150,
                      height: 150,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        // image: DecorationImage(
                        //   fit: BoxFit.cover,
                        //   // You can use an audio icon/image here
                        //   //image: AssetImage('/assets/images/audio_icon.png'),
                        // ),
                      ),
                    ),
              ElevatedButton(
                onPressed: getAudio,
                child: const Text("Pick Audio"),
              ),
              ElevatedButton(
                onPressed: selectedAudio != null
                    ? () async {
                        //await saveAudioWave(selectedAudio);
                        await sendAudioToBackend(selectedAudio!);
                      }
                    : null,
                child: const Text("Upload Audio"),
              ),
              if (message != null) Text(message!),
            ],
          ),
        ),
      ),
    );
  }
}
