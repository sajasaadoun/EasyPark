// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class AppointScreen extends StatelessWidget {
//   const AppointScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: SingleChildScrollView(
//           child: Column(
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.width / 2.1,
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage("assets/images/doctor_1.jpg"),
//                     fit: BoxFit.cover),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 )),
//             child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.blueAccent.withOpacity(0.9),
//                       Colors.blue..withOpacity(0),
//                       Colors.white.withOpacity(0),
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 30, left: 10, right: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           InkWell(
//                             onTap: () {},
//                             child: Container(
//                                 margin: EdgeInsets.all(8),
//                                 height: 45,
//                                 width: 45,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(10),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black,
//                                       blurRadius: 4,
//                                       spreadRadius: 2,
//                                     )
//                                   ],
//                                 ),
//                                 child: Center(
//                                   child: Icon(
//                                     Icons.arrow_back,
//                                     color: Colors.blue,
//                                     size: 28,
//                                   ),
//                                 )),
//                           ),
//                           Container(
//                             margin: EdgeInsets.all(8),
//                             height: 45,
//                             width: 45,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black,
//                                     blurRadius: 4,
//                                     spreadRadius: 2,
//                                   )
//                                 ]),
//                             child: Center(
//                               child: Icon(
//                                 Icons.favorite_outline,
//                                 color: Colors.blue,
//                                 size: 28,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 80,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Patients",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "1.8k",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Patients",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "1.8k",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 "Patients",
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Text(
//                                 "1.8k",
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 )),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Dr Nathalie",
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.heart_broken,
//                       color: Colors.red,
//                       size: 28,
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Text(
//                       "Surgeon",
//                       style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.blueAccent.withOpacity(0.6),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Text(
//                   'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
//                   style: TextStyle(
//                     fontSize: 17,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black.withOpacity(0.6),
//                   ),
//                   textAlign: TextAlign.justify,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 Text(
//                   "Book Date",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black.withOpacity(0.6),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Container(
//                     height: 70,
//                     child: ListView.builder(
//                         shrinkWrap: true,
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 6,
//                         itemBuilder: (context, index) {
//                           return Column(
//                             children: [
//                               Container(
//                                   margin: EdgeInsets.symmetric(
//                                       horizontal: 8, vertical: 5),
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 5, horizontal: 25),
//                                   decoration: BoxDecoration(
//                                     color:
//                                         index == 1 ? Colors.blue : Colors.white,
//                                     borderRadius: BorderRadius.circular(10),
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.blueAccent,
//                                           blurRadius: 4,
//                                           spreadRadius: 2)
//                                     ],
//                                   ),
//                                   child: Column(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       SizedBox(
//                                         height: 5,
//                                       ),
//                                       Text(
//                                         "${index + 8}",
//                                         style: TextStyle(
//                                           color: index == 3
//                                               ? Colors.white
//                                               : Colors.blueAccent
//                                                   .withOpacity(0.6),
//                                         ),
//                                       ),
//                                       Text(
//                                         "DEC",
//                                         style: TextStyle(
//                                           color: index == 1
//                                               ? Colors.white
//                                               : Colors.blueAccent
//                                                   .withOpacity(0.6),
//                                         ),
//                                       )
//                                     ],
//                                   ))
//                             ],
//                           );
//                         }))
//               ],
//             ),
//           )
//         ],
//       )),
//     );
//   }
// }
