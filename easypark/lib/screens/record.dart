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

  Future stop() async {
    await recorder.stopRecorder();
  }

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

                return Text('${duration.inSeconds}s');
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
