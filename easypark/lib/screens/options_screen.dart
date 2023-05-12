import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/doctor_provider.dart';
import 'booking_screen.dart';

class MyPlansScreen extends ConsumerStatefulWidget {
  MyPlansScreen({Key? key});

  @override
  ConsumerState<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends ConsumerState<MyPlansScreen> {
  @override
  Widget build(BuildContext context) {
    final EventData = ref.watch(doctorsDataProvider);
    return Scaffold(
        backgroundColor: const Color(0xFFF6F7FF),
        appBar: AppBar(
          title: const Text('My Doctors'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  DefaultTabController(
                      length: 1,
                      child: SingleChildScrollView(
                        child: Expanded(
                          child: Column(
                            children: [
                              const TabBar(
                                indicatorColor: Colors.blue,
                                unselectedLabelColor: Color(0xFF555555),
                                labelColor: Colors.blue,
                                labelPadding:
                                    EdgeInsets.symmetric(horizontal: 8.0),
                                tabs: [
                                  Tab(
                                    text: "All Doctors ",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              EventData.when(
                                data: (value) => SafeArea(
                                  child: SingleChildScrollView(
                                    child: Container(
                                      height: 600,
                                      child: TabBarView(
                                        children: [
                                          //Now let's create our first tab page
                                          Container(
                                            child: ListView.builder(
                                                itemCount: value.docs.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10.0,
                                                            top: 10.0),
                                                    child: Card(
                                                      margin: EdgeInsets.zero,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  '${value.docs[index].get('name')}',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                // Text(
                                                                //   DateFormat('dd-MM-yy').format(order.createdAt),
                                                                //   'Event ID: ${value.get('name')}"',
                                                                //   style: const TextStyle(
                                                                //     fontSize: 16,
                                                                //     fontWeight: FontWeight.bold,
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            ListView.builder(
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const NeverScrollableScrollPhysics(),
                                                                itemCount: 1,
                                                                itemBuilder:
                                                                    (BuildContext
                                                                            context,
                                                                        int index) {
                                                                  return Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            10.0),
                                                                    child: Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              30,
                                                                          width:
                                                                              30,
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/doctor_1.jpg',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                        const SizedBox(
                                                                          width:
                                                                              10,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            SizedBox(
                                                                              width: 200,
                                                                              child: Text(
                                                                                '${value.docs[index].get('description')}',
                                                                                style: const TextStyle(
                                                                                  fontSize: 14,
                                                                                ),
                                                                                overflow: TextOverflow.clip,
                                                                                maxLines: 5,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  );
                                                                }),
                                                            const SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    // ignore: prefer_const_constructors
                                                                    Text(
                                                                      'Location:',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      '${value.docs[index].get('location')}',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    // ignore: prefer_const_constructors
                                                                    Text(
                                                                      'Price:',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      '${value.docs[index].get('price')} LE',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator
                                                                            .pushNamed(
                                                                          context,
                                                                          'DoctorsInfo',
                                                                          arguments:
                                                                              index,
                                                                        );
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .white,
                                                                          minimumSize: Size(
                                                                              150,
                                                                              40)),
                                                                      child:
                                                                          const Text(
                                                                        "View",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                            color:
                                                                                Colors.black),
                                                                      )),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              BookingScreen(doctor: '${value.docs[index].get('name')}'),
                                                                        ),
                                                                      );
                                                                    },
                                                                    style: ElevatedButton
                                                                        .styleFrom(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      minimumSize:
                                                                          Size(
                                                                              150,
                                                                              40),
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Consult Now",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ])
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                error: (Object error, StackTrace stackTrace) {
                                  return const Text("Error loading your plans");
                                },
                                loading: () {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                },
                              )
                            ],
                          ),
                        ),
                      ))
                ])));
  }
}
