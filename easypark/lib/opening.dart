import 'package:flutter/material.dart';

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/open.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120.0),
              // ignore: prefer_const_literals_to_create_immutables
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hello, مرحباَ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'EasyPark ايزي بارك',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Colors.deepPurple[100],
                  //     borderRadius: BorderRadius.circular(12),
                  //   ),
                  //   child: const Icon(Icons.person),
                  // )
                ],
              ),
            ),

            const SizedBox(height: 150),
            Container(
              height: 350,
              width: 900,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[600],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                          ),
                          // Image.asset('assets/images/detection.png',
                          //     height: 30),
                          // const SizedBox(
                          //   width: 25,
                          // ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'login');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('English')),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 0, 70, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.blue[600],
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 90,
                          ),
                          // Image.asset('assets/images/severity.png', height: 30),
                          // const SizedBox(
                          //   width: 25,
                          // ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ar/login');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('Arabic')),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(70, 0, 70, 15),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12),
                  //       color: Colors.blue[600],
                  //     ),
                  //     child: Row(
                  //       //  Navigator.pushNamed(context, ''),
                  //       children: [
                  //         const SizedBox(
                  //           width: 25,
                  //         ),
                  //         Image.asset('assets/images/online-survey.png',
                  //             height: 30),
                  //         const SizedBox(
                  //           width: 25,
                  //         ),
                  //         ElevatedButton(
                  //             onPressed: () {},
                  //             style: ElevatedButton.styleFrom(
                  //               backgroundColor: Colors.blue[600],
                  //             ),
                  //             child: const Text('Questionnaire')),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}