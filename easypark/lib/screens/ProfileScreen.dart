// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// class profilescreen extends StatelessWidget {
//   const profilescreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {}, icon: Icon(LineAwesomeIcons.angle_left)),
//         title: Text(
//           'profile',
//           style: Theme.of(context).textTheme.headline4,
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(isdark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(4),
//           child: Column(
//             children: [
//               SizedBox(
//                 width: 120,
//                 height: 120,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(100),
//                   child: Image(
//                     image: AssetImage('avatar.png'),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               Text("profile heading",
//                   style: Theme.of(context).textTheme.headline4),
//               Text("profile heading2",
//                   style: Theme.of(context).textTheme.bodyText2),
//               const SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: 200,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.yellow,
//                       side: BorderSide.none,
//                       shape: const StadiumBorder()),
//                   child: const Text(
//                     "Edit Profile",
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Divider(),
//               const SizedBox(
//                 height: 10,
//               ),
//               ProfileMenuWidget(
//                 title: "Settings",
//                 icon: LineAwesomeIcons.cog,
//                 onPress: () {},
//               ),
//               const Divider(),
//               ProfileMenuWidget(
//                 title: "details",
//                 icon: LineAwesomeIcons.wallet,
//                 onPress: () {},
//               ),
//               const Divider(),
//               ProfileMenuWidget(
//                 title: "logout",
//                 icon: LineAwesomeIcons.alternate_sign_out,
//                 TextColor: Colors.red,
//                 onPress: () {},
//               ),
//               const Divider(),
//               ProfileMenuWidget(
//                 title: "information",
//                 icon: LineAwesomeIcons.info,
//                 onPress: () {},
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfileMenuWidget extends StatelessWidget {
//   const ProfileMenuWidget(
//       {Key? key,
//       required this.title,
//       required this.icon,
//       required this.onPress,
//       this.endIcon = true,
//       this.TextColor})
//       : super(key: key);

//   final String title;
//   final IconData icon;
//   final VoidCallback onPress;
//   final bool endIcon;
//   final Color? TextColor;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: onPress,
//       leading: Container(
//         width: 40,
//         height: 40,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             color: Colors.yellow.withOpacity(0.1)),
//         child: Icon(
//           LineAwesomeIcons.cog,
//           color: Colors.yellow,
//         ),
//       ),
//       title: Text(
//         "menu",
//         style: Theme.of(context).textTheme.bodyText1?.apply(color: TextColor),
//       ),
//       trailing: endIcon
//           ? Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(100),
//                   color: Colors.grey.withOpacity(0.1)),
//               child: const Icon(LineAwesomeIcons.angle_right,
//                   size: 18.0, color: Colors.grey),
//             )
//           : null,
//     );
//   }
// }
