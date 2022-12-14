import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class speechPage extends StatefulWidget {
  const speechPage({super.key});

  @override
  State<speechPage> createState() => _speechPageState();
}

class _speechPageState extends State<speechPage> {
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Jerome Bell',
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
                    color: Colors.pink[100],
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
                                      // fontWeight: FontWeight.bold,
                                    )
                                    // '${duration.inSeconds}s'
                                    );
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
                          ]
                          // decoration: const BoxDecoration(
                          //   image: DecorationImage(
                          //     image: AssetImage('assets/doc.jpg'),
                          //     fit: BoxFit.fill,
                          //   ),
                          //   shape: BoxShape.circle,
                          // ),

                          // // color: Colors.deepPurple[600],
                          ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Text(
                            'click the button to record your voice record ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          // const SizedBox(height: 8),
                          // const Text(
                          //   'Detect wether you have Parkinson disease',
                          //   style: TextStyle(
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
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