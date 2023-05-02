import 'package:flutter/material.dart';

class DoctorPageAr extends StatefulWidget {
  const DoctorPageAr({super.key});

  @override
  State<DoctorPageAr> createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPageAr> {
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
                          'مرحباَ,',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'ايزي بارك دكتور',
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
                          Image.asset('assets/images/detection.png',
                              height: 30),
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
                              child: const Text('المرضي')),
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
                          Image.asset('assets/images/severity.png', height: 30),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('نتائج التجارب')),
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
                          Image.asset('assets/images/online-survey.png',
                              height: 30),
                          const SizedBox(
                            width: 25,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[600],
                              ),
                              child: const Text('الاستبيان')),
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
