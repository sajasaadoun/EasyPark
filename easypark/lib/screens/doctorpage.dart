import 'package:easypark/provider/patientInfo_provider.dart';
import 'package:easypark/screens/patientReport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DoctorPage extends ConsumerStatefulWidget {
  const DoctorPage({super.key});

  @override
  ConsumerState<DoctorPage> createState() => _DoctorPageState();
}

class _DoctorPageState extends ConsumerState<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    final plcRead = ref.watch(patientInfoProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome Back',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'home');
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: plcRead.when(
            data: (value) => SafeArea(
                child: Column(children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: value.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          // ignore: prefer_const_literals_to_create_immutables
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 17.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Doctor Alia',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[600],
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 100,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/doc.jpg'),
                                              fit: BoxFit.fill,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          // color: Colors.deepPurple[600],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            const Text(
                                              'Have A Good Day',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            const Text(
                                              'You have the power to change lives!',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            const SizedBox(height: 12),
                                            Container(
                                              padding: const EdgeInsets.all(12),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: const Center(
                                                child: Text('Get Started'),
                                              ),
                                            )
                                          ],
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple[100],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const TextField(
                                      decoration: InputDecoration(
                                          prefixIcon: (Icon(Icons.search)),
                                          border: InputBorder.none,
                                          hintText: 'How can we help you?'),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Container(
                                  height: 80,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color: Colors.blue[600],
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/detection.png',
                                                  height: 30),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, '/test');
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue[600],
                                                    elevation: 0,
                                                  ),
                                                  child: const Text(
                                                      'Quetionnaire')),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.blue[600],
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/severity.png',
                                                  height: 30),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue[600],
                                                    elevation: 0,
                                                  ),
                                                  child:
                                                      const Text('Messages')),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.blue[600],
                                          ),
                                          child: Row(
                                            //  Navigator.pushNamed(context, ''),
                                            children: [
                                              Image.asset(
                                                  'assets/images/online-survey.png',
                                                  height: 30),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue[600],
                                                    elevation: 0,
                                                  ),
                                                  child: const Text(
                                                      'Edit Profile')),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Colors.blue[600],
                                          ),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/contact.png',
                                                  height: 30),
                                              // ignore: prefer_const_constructors
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ElevatedButton(
                                                  onPressed: () {},
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.blue[600],
                                                    elevation: 0,
                                                  ),
                                                  child: const Text(
                                                      'Contact patients')),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // ignore: prefer_const_constructors
                                SizedBox(height: 25),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text('Your Patients List',
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Expanded(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.deepPurple[100],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                  '${value.docs[index].get('name')}'),
                                              Text(
                                                  '${value.docs[index].get('name')}'),
                                              const SizedBox(height: 10),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 208, 205, 214),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: TextButton(
                                                  onPressed: () async {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PatientReport(
                                                                    value.docs[
                                                                        index])));
                                                  },
                                                  child: Text(
                                                    'View Patient',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        );
                      }))
            ])),
            error: (Object error, StackTrace err) {
              return const Text("Error loading your list");
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
