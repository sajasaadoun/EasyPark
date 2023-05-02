// library social_media_recorder;
// import 'dart:io';
// import 'package:easypark/widgets/lock_record.dart';
// import 'package:easypark/widgets/show_mic_with_text.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:easypark/widgets/audio_encoder_type.dart';
// import 'package:easypark/widgets/show_counter.dart';
// import '../widgets/sound_recorder_when_locked_design.dart';
// class SocialMediaRecorder extends StatefulWidget {
//   /// use it for change back ground of cancel
//   final Color? cancelTextBackGroundColor;

//   /// function reture the recording sound file
//   final Function(File soundFile) sendRequestFunction;

//   /// recording Icon That pressesd to start record
//   final Widget? recordIcon;

//   /// recording Icon when user locked the record
//   final Widget? recordIconWhenLockedRecord;

//   /// use to change the backGround Icon when user recording sound
//   final Color? recordIconBackGroundColor;

//   /// use to change the Icon backGround color when user locked the record
//   final Color? recordIconWhenLockBackGroundColor;

//   /// use to change all recording widget color
//   final Color? backGroundColor;

//   /// use to change the counter style
//   final TextStyle? counterTextStyle;

//   /// text to know user should drag in the left to cancel record
//   final String? slideToCancelText;

//   /// use to change slide to cancel textstyle
//   final TextStyle? slideToCancelTextStyle;

//   /// this text show when lock record and to tell user should press in this text to cancel recod
//   final String? cancelText;

//   /// use to change cancel text style
//   final TextStyle? cancelTextStyle;

//   /// put you file directory storage path if you didn't pass it take deafult path
//   final String? storeSoundRecoringPath;

//   /// Chose the encode type
//   final AudioEncoderType encode;

//   /// use if you want change the raduis of un record
//   final BorderRadius? radius;

//   // use to change the counter back ground color
//   final Color? counterBackGroundColor;

//   // use to change lock icon to design you need it
//   final Widget? lockButton;
//   // use it to change send button when user lock the record
//   final Widget? sendButtonIcon;

//   // ignore: sort_constructors_first
//   const SocialMediaRecorder({
//     this.sendButtonIcon,
//     this.storeSoundRecoringPath = "",
//     required this.sendRequestFunction,
//     this.recordIcon,
//     this.lockButton,
//     this.counterBackGroundColor,
//     this.recordIconWhenLockedRecord,
//     this.recordIconBackGroundColor = Colors.blue,
//     this.recordIconWhenLockBackGroundColor = Colors.blue,
//     this.backGroundColor,
//     this.cancelTextStyle,
//     this.counterTextStyle,
//     this.slideToCancelTextStyle,
//     this.slideToCancelText = " Slide to Cancel >",
//     this.cancelText = "Cancel",
//     this.encode = AudioEncoderType.AAC,
//     this.cancelTextBackGroundColor,
//     this.radius,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _SocialMediaRecorder createState() => _SocialMediaRecorder();
// }

// class _SocialMediaRecorder extends State<SocialMediaRecorder> {
//   late SoundRecordNotifier soundRecordNotifier;

//   @override
//   void initState() {
//     soundRecordNotifier = SoundRecordNotifier();
//     soundRecordNotifier.initialStorePathRecord =
//         widget.storeSoundRecoringPath ?? "";
//     soundRecordNotifier.isShow = false;
//     soundRecordNotifier.voidInitialSound();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(create: (context) => soundRecordNotifier),
//         ],
//         child: Consumer<SoundRecordNotifier>(
//           builder: (context, value, _) {
//             return Directionality(
//                 textDirection: TextDirection.rtl, child: makeBody(value));
//           },
//         ));
//   }

//   Widget makeBody(SoundRecordNotifier state) {
//     return Column(
//       children: [
//         GestureDetector(
//           onHorizontalDragUpdate: (scrollEnd) {
//             state.updateScrollValue(scrollEnd.globalPosition, context);
//           },
//           onHorizontalDragEnd: (x) {},
//           child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 topRight: Radius.circular(12),
//               ),
//             ),
//             child: recordVoice(state),
//           ),
//         )
//       ],
//     );
//   }

//   Widget recordVoice(SoundRecordNotifier state) {
//     if (state.lockScreenRecord == true) {
//       return SoundRecorderWhenLockedDesign(
//         cancelText: widget.cancelText,
//         sendButtonIcon: widget.sendButtonIcon,
//         cancelTextBackGroundColor: widget.cancelTextBackGroundColor,
//         cancelTextStyle: widget.cancelTextStyle,
//         counterBackGroundColor: widget.counterBackGroundColor,
//         recordIconWhenLockBackGroundColor:
//             widget.recordIconWhenLockBackGroundColor ?? Colors.blue,
//         counterTextStyle: widget.counterTextStyle,
//         recordIconWhenLockedRecord: widget.recordIconWhenLockedRecord,
//         sendRequestFunction: widget.sendRequestFunction,
//         soundRecordNotifier: state,
//       );
//     }

//     return Listener(
//       onPointerDown: (details) async {
//         state.setNewInitialDraggableHeight(details.position.dy);
//         state.resetEdgePadding();

//         soundRecordNotifier.isShow = true;
//         state.record();
//       },
//       onPointerUp: (details) async {
//         if (!state.isLocked) {
//           if (state.buttonPressed) {
//             if (state.second > 1 || state.minute > 0) {
//               String path = state.mPath;
//               widget.sendRequestFunction(File.fromUri(Uri(path: path)));
//             }
//           }
//           state.resetEdgePadding();
//         }
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: soundRecordNotifier.isShow ? 0 : 300),
//         height: 50,
//         width: (soundRecordNotifier.isShow)
//             ? MediaQuery.of(context).size.width
//             : 40,
//         child: Stack(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(right: state.edge),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: soundRecordNotifier.isShow
//                       ? BorderRadius.circular(12)
//                       : widget.radius != null && !soundRecordNotifier.isShow
//                           ? widget.radius
//                           : BorderRadius.circular(0),
//                   color: widget.backGroundColor ?? Colors.grey.shade100,
//                 ),
//                 child: Stack(
//                   children: [
//                     ShowMicWithText(
//                       counterBackGroundColor: widget.counterBackGroundColor,
//                       backGroundColor: widget.recordIconBackGroundColor,
//                       recordIcon: widget.recordIcon,
//                       shouldShowText: soundRecordNotifier.isShow,
//                       soundRecorderState: state,
//                       slideToCancelTextStyle: widget.slideToCancelTextStyle,
//                       slideToCancelText: widget.slideToCancelText,
//                     ),
//                     if (soundRecordNotifier.isShow)
//                       ShowCounter(
//                           counterBackGroundColor: widget.counterBackGroundColor,
//                           soundRecorderState: state),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 60,
//               child: LockRecord(
//                 soundRecorderState: state,
//                 lockIcon: widget.lockButton,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // import 'dart:io';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// // import 'package:path_provider/path_provider.dart';
// // import 'package:flutter_sound/flutter_sound.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:audioplayers/audioplayers.dart';

// // class RecordingPage extends StatefulWidget {
// //   @override
// //   _RecordingPageState createState() => _RecordingPageState();
// // }

// // class Recording {
// //   String path;
// //   String name;
// //   int duration;

// //   Recording({required this.path, required this.name, required this.duration});
// // }

// // class _RecordingPageState extends State<RecordingPage> {
// //   bool isRecording = false;
// //   bool isPlaying = false;
// //   FlutterSoundRecorder recorder = FlutterSoundRecorder();
// //   FlutterSoundPlayer player = FlutterSoundPlayer();
// //   late Recording recording;
// //   late String audioFilePath;

// //   void startRecording() async {
// //     try {
// //       Directory tempDir = await getTemporaryDirectory();
// //       audioFilePath = '${tempDir.path}/audio_recording.wav';
// //       await recorder.openAudioSession();
// //       await recorder.startRecorder(
// //         toFile: audioFilePath,
// //         codec: Codec.pcm16WAV,
// //       );
// //       setState(() {
// //         isRecording = true;
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   void stopRecording() async {
// //     await recorder.stopRecorder();
// //     await recorder.closeAudioSession();
// //     setState(() {
// //       isRecording = false;
// //       recording = Recording(
// //         path: audioFilePath,
// //         name: 'audio_recording.wav',
// //         duration: 0,
// //       );
// //     });
// //   }

// //   Future<String> uploadRecording() async {
// //     String fileName = recording.name;
// //     Reference reference = FirebaseStorage.instance.ref().child(fileName);
// //     UploadTask uploadTask = reference.putFile(File(recording.path));
// //     TaskSnapshot storageTaskSnapshot = await uploadTask;
// //     String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
// //     return downloadUrl;
// //   }

// //   void playRecording() async {
// //     try {
// //       await player.startPlayer(
// //         fromURI: recording.path,
// //         codec: Codec.pcm16WAV,
// //         whenFinished: () {
// //           setState(() {
// //             isPlaying = false;
// //           });
// //         },
// //       );
// //       setState(() {
// //         isPlaying = true;
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   void stopPlaying() async {
// //     await player.stopPlayer();
// //     setState(() {
// //       isPlaying = false;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Recording Tool'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             isRecording
// //                 ? ElevatedButton(
// //                     onPressed: stopRecording,
// //                     child: Text('Stop Recording'),
// //                   )
// //                 : ElevatedButton(
// //                     onPressed: startRecording,
// //                     child: Text('Start Recording'),
// //                   ),
// //             SizedBox(height: 20),
// //             recording != null
// //                 ? ElevatedButton(
// //                     onPressed: () async {
// //                       String downloadUrl = await uploadRecording();
// //                       audioPlayer.play(downloadUrl as Source);
// //                     },
// //                     child: Text('Play Recording'),
// //                   )
// //                 : SizedBox(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_sound/flutter_sound.dart';
// // import 'package:permission_handler/permission_handler.dart';

// // class SpeechPage extends StatefulWidget {
// //   const SpeechPage({super.key});

// //   @override
// //   State<SpeechPage> createState() => _SpeechPageState();
// // }

// // class _SpeechPageState extends State<SpeechPage> {
// //   List<String> str = [
// //     "Click on the record button",
// //     "Start talking about anything for 30 seconds",
// //     "Click again on the button to stop recording",
// //   ];
// //   final recorder = FlutterSoundRecorder();
// //   bool isRecorderReady = false;
// //   @override
// //   void initState() {
// //     super.initState();
// //     initRecorder();
// //   }

// //   @override
// //   void dispose() {
// //     recorder.closeRecorder();
// //     super.dispose();
// //   }

// //   Future initRecorder() async {
// //     final status = await Permission.microphone.request();

// //     if (status != PermissionStatus.granted) {
// //       throw 'microphone permission not granted';
// //     }

// //     await recorder.openRecorder();
// //     isRecorderReady = true;

// //     recorder.setSubscriptionDuration(
// //       const Duration(microseconds: 500),
// //     );
// //   }

// //   Future record() async {
// //     if (!isRecorderReady) return;
// //     await recorder.startRecorder(toFile: 'audio');
// //   }

// //   Future stop() async {
// //     if (!isRecorderReady) return;
// //     final path = await recorder.stopRecorder();
// //     final audioFile = File(path!);
// //     print('recorded audio :$audioFile');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[200],
// //       // ignore: prefer_const_literals_to_create_immutables
// //       bottomNavigationBar: BottomNavigationBar(items: [
// //         const BottomNavigationBarItem(
// //           icon: Icon(Icons.home),
// //           label: '',
// //         ),
// //         const BottomNavigationBarItem(
// //           icon: Icon(Icons.message),
// //           label: '',
// //         ),
// //         const BottomNavigationBarItem(
// //           icon: Icon(Icons.arrow_circle_left),
// //           label: '',
// //         )
// //       ]),
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //               // ignore: prefer_const_literals_to_create_immutables
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: const [
// //                       Padding(
// //                         padding: EdgeInsets.only(top: 17.0),
// //                         child: Text(
// //                           'Hello,',
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 18,
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         'EasyPark Patient',
// //                         style: TextStyle(fontSize: 20),
// //                       ),
// //                     ],
// //                   ),
// //                   Container(
// //                     decoration: BoxDecoration(
// //                       color: Colors.deepPurple[100],
// //                       borderRadius: BorderRadius.circular(12),
// //                     ),
// //                     child: const Icon(Icons.person),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 25),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 25.0),
// //               child: Container(
// //                 padding: const EdgeInsets.all(20),
// //                 decoration: BoxDecoration(
// //                     color: Colors.blue[600],
// //                     borderRadius: BorderRadius.circular(12)),
// //                 child: Row(
// //                   children: [
// //                     Center(
// //                       child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           children: [
// //                             StreamBuilder<RecordingDisposition>(
// //                               stream: recorder.onProgress,
// //                               builder: (context, snapshot) {
// //                                 final duration = snapshot.hasData
// //                                     ? snapshot.data!.duration
// //                                     : Duration.zero;
// //                                 String twoDigits(int n) =>
// //                                     n.toString().padLeft(2, '');
// //                                 final twoDigitMin =
// //                                     twoDigits(duration.inMinutes.remainder(60));
// //                                 final twoDigitSec =
// //                                     twoDigits(duration.inSeconds.remainder(60));
// //                                 return Text('$twoDigitMin:$twoDigitSec',
// //                                     style: const TextStyle(
// //                                       fontSize: 40,
// //                                     ));
// //                               },
// //                             ),
// //                             ElevatedButton(
// //                                 child: Icon(
// //                                   recorder.isRecording ? Icons.stop : Icons.mic,
// //                                   size: 80,
// //                                 ),
// //                                 onPressed: () async {
// //                                   if (recorder.isRecording) {
// //                                     await stop();
// //                                   } else {
// //                                     await record();
// //                                   }
// //                                   setState(() {});
// //                                 })
// //                           ]),
// //                     ),
// //                     const SizedBox(
// //                       width: 20,
// //                     ),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         // ignore: prefer_const_literals_to_create_immutables
// //                         children: [
// //                           const Text(
// //                             'CLICK TO RECORD ',
// //                             style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               fontSize: 16,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(
// //               width: 50,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(10),
// //               child: Row(
// //                 children: [
// //                   const Text(
// //                     'Instructions',
// //                     style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(25),
// //               child: Container(
// //                 padding: const EdgeInsets.symmetric(vertical: 25),
// //                 decoration: BoxDecoration(
// //                     color: Colors.blue[600],
// //                     borderRadius: BorderRadius.circular(20)),
// //                 child: Column(
// //                   children: str.map((strone) {
// //                     return Row(children: [
// //                       const Text(
// //                         "\u2022",
// //                         style: TextStyle(
// //                             fontSize: 15, fontWeight: FontWeight.bold),
// //                       ), //bullet text
// //                       const SizedBox(
// //                         width: 10,
// //                       ), //space between bullet and text
// //                       Expanded(
// //                         child: Text(
// //                           strone,
// //                           style: const TextStyle(fontSize: 18),
// //                         ), //text
// //                       )
// //                     ]);
// //                   }).toList(),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

