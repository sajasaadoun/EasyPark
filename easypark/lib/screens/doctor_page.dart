import 'package:flutter/material.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({super.key});

  @override
  State<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
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
                  Padding(
                    padding: const EdgeInsets.only(top: 17.0),
                    child: Column(
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
                          'EasyPark Doctor',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
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
                            width: 25,
                          ),
                          Image.asset('assets/detection.png', height: 30),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '/test');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('Patients')),
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
                            width: 25,
                          ),
                          Image.asset('assets/severity.png', height: 30),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('Test Results')),
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
                        //  Navigator.pushNamed(context, ''),
                        children: [
                          const SizedBox(
                            width: 25,
                          ),
                          Image.asset('assets/online-survey.png', height: 30),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('Questionnaire')),
                        ],
                      ),
                    ),
                  ),
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
