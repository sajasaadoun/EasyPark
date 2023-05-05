// import 'dart:html';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class recordPage extends StatefulWidget {
  const recordPage({super.key});

  @override
  State<recordPage> createState() => _recordPageState();
}

class _recordPageState extends State<recordPage> {
  final recorder = FlutterSoundRecorder();
  Future record() async {
    await recorder.startRecorder(toFile: 'audio');
  }

  Future<void> stop() async {
    await recorder.stopRecorder();
  }
// Future<void> stop() async {
//   final path = await recorder.stopRecorder();
//   // final audioFile = File(path!.path);
//   // final audioBytes = await audioFile.readAsBytes();
//   // final audioBase64 = base64Encode(audioBytes);
//   // print('recorder audio: $audioBase64');
// }

  @override
  void initState() {
    super.initState();

    intiRecorder();
  }

  @override
  void dispose() {
    recorder.closeRecorder();
  }

  Future intiRecorder() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw 'Microphone not granted';
    }
    await recorder.openRecorder();
    recorder.setSubscriptionDuration(
      const Duration(microseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<RecordingDisposition>(
              stream: recorder.onProgress,
              builder: (context, snapshot) {
                final duration =
                    snapshot.hasData ? snapshot.data!.duration : Duration.zero;
                String twodigits(int n) => n.toString().padLeft(1);
                final twodigitsMin =
                    twodigits(duration.inMinutes.remainder(60));
                final twodigitsSECONDS =
                    twodigits(duration.inSeconds.remainder(60));
                return Text(
                  '$twodigitsMin:$twodigitsSECONDS',
                  style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
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
              },
            )
          ],
        ),
      ),
    );
  }
}
