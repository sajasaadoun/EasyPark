import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:easypark/apis/uploadfile_api.dart';
import 'package:easypark/widgets/uploadbutton_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:easypark/screens/uploadfiles.dart';

class SpeechPageAr extends StatefulWidget {
  const SpeechPageAr({super.key});

  @override
  State<SpeechPageAr> createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPageAr> {
  UploadTask? task;
  File? file;
  List<String> str = [
    "اضغط علي زر التسجيل",
    "تحدث لمدة 30 ثانية",
    "اضغط مجددا على زر التشغيل للايقاف",
  ];
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

  final recorder = FlutterSoundRecorder();
  bool isRecorderReady = false;
  @override
  void initState() {
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'microphone permission not granted';
    }

    await recorder.openRecorder();
    isRecorderReady = true;

    recorder.setSubscriptionDuration(
      const Duration(microseconds: 500),
    );
  }

  Future record() async {
    if (!isRecorderReady) return;
    await recorder.startRecorder(toFile: 'audio');
  }

  Future stop() async {
    if (!isRecorderReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    print('recorded audio :$audioFile');
  }

  @override
  Widget build(BuildContext context) {
    final fileName =
        file != null ? basename(file!.path) : 'لم يتم اختيار اي ملف';
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // ignore: prefer_const_literals_to_create_immutables
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   const BottomNavigationBarItem(
      //     icon: Icon(Icons.home),
      //     label: '',
      //   ),
      //   const BottomNavigationBarItem(
      //     icon: Icon(Icons.message),
      //     label: '',
      //   ),
      //   const BottomNavigationBarItem(
      //     icon: Icon(Icons.arrow_circle_left),
      //     label: '',
      //   )
      // ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 17.0),
                        child: Text(
                          'مرحباَ,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'مستخدم ايزي بارك',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StreamBuilder<RecordingDisposition>(
                              stream: recorder.onProgress,
                              builder: (context, snapshot) {
                                final duration = snapshot.hasData
                                    ? snapshot.data!.duration
                                    : Duration.zero;
                                String twoDigits(int n) =>
                                    n.toString().padLeft(2, '');
                                final twoDigitMin =
                                    twoDigits(duration.inMinutes.remainder(60));
                                final twoDigitSec =
                                    twoDigits(duration.inSeconds.remainder(60));
                                return Text('$twoDigitMin:$twoDigitSec',
                                    style: const TextStyle(
                                      fontSize: 40,
                                    ));
                              },
                            ),
                            ElevatedButton(
                                child: Icon(
                                  recorder.isRecording ? Icons.stop : Icons.mic,
                                  size: 80,
                                ),
                                onPressed: () async {
                                  if (recorder.isRecording) {
                                    await stop();
                                  } else {
                                    await record();
                                  }
                                  setState(() {});
                                })
                          ]),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'اضغط للتسجيل',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  const Text(
                    'التعليمات',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: str.map((strone) {
                    return Row(children: [
                      const Text(
                        "\u2022",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ), //bullet text
                      const SizedBox(
                        width: 10,
                      ), //space between bullet and text
                      Expanded(
                        child: Text(
                          strone,
                          style: const TextStyle(fontSize: 18),
                        ), //text
                      )
                    ]);
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  const Text(
                    'أو قم بتحميل سجل من جهازك',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(32),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UploadButtonWidget(
                      text: 'اختر الملف الصوتي',
                      icon: Icons.attach_file,
                      onClicked: selectFile,
                    ),
                    SizedBox(height: 8),
                    Text(
                      fileName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 48),
                    // UploadButtonWidget(
                    //   text: 'Upload File',
                    //   icon: Icons.cloud_upload_outlined,
                    //   onClicked: uploadFile,
                    // ),
                    SizedBox(height: 20),
                    task != null ? buildUploadStatus(task!) : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
