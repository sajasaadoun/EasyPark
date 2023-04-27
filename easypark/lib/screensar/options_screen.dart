import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/doctor_provider.dart';

// import '../data/repo/events_provider.dart';
// import '../data/repo/myplans_provider.dart';
// import '../data/repo/pending_provider.dart';
// import '../data/repo/places_provider.dart';

class MyPlansScreenAr extends ConsumerStatefulWidget {
  MyPlansScreenAr({Key? key});

  @override
  ConsumerState<MyPlansScreenAr> createState() => _MyPlansScreenArState();
}

class _MyPlansScreenArState extends ConsumerState<MyPlansScreenAr> {
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list

  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    // final PlacesData = ref.watch(placesDataProvider);
    // final MyPlansData = ref.watch(plansDataProvider);
    final EventData = ref.watch(doctorsDataProvider);
    return Scaffold(
        backgroundColor: const Color(0xFFF6F7FF),
        appBar: AppBar(
          title: const Text('خططي'),
          backgroundColor: Colors.blue,
          // elevation: 0.0,
          // backgroundColor: Color(0xFFF6F7FF),
          // title: Row(
          //   children: [
          //     IconButton(
          //       onPressed: () {},
          //       icon: Icon(
          //         Icons.menu,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ],
          // ),
        ),
        body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  //Now let's Add a Tabulation bar
                  DefaultTabController(
                      length: 3,
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
                                    text: "كل الاطباء",
                                  ),
                                  Tab(
                                    text: "حجوزاتي",
                                  ),
                                  Tab(
                                    text: "نتائجي",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              EventData.when(
                                data: (value) => SafeArea(
                                  child: Container(
                                    height: 500.0,
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
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'سجي',
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 16,
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
                                                              shrinkWrap: true,
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
                                                                        child: Image
                                                                            .asset(
                                                                          'assets/doctor_1.jpg',
                                                                          fit: BoxFit
                                                                              .cover,
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
                                                                            height:
                                                                                10,
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                200,
                                                                            child:
                                                                                Text(
                                                                              'متخصص في اكتشاف شلل الرعاش',
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
                                                                    'العنوان',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'الزمالك',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  // ignore: prefer_const_constructors
                                                                  Text(
                                                                    'السعر',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    '${value.docs[index].get('price')} جنيهاَ',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
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
                                                                        () {},
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .blue,
                                                                        minimumSize: Size(
                                                                            150,
                                                                            40)),
                                                                    child:
                                                                        const Text(
                                                                      "المزيد",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    )),
                                                                ElevatedButton(
                                                                    onPressed:
                                                                        () {},
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            Colors
                                                                                .blue,
                                                                        minimumSize: Size(
                                                                            150,
                                                                            40)),
                                                                    child:
                                                                        const Text(
                                                                      "حجز ميعاد",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    )),
                                                              ])
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                        EventData.when(
                                          data: (value) => SafeArea(
                                            child: Container(
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
                                                                    'سجي',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
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
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          SizedBox(
                                                                            height:
                                                                                30,
                                                                            width:
                                                                                30,
                                                                            child:
                                                                                Image.asset(
                                                                              'assets/doctor_1.jpg',
                                                                              fit: BoxFit.cover,
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
                                                                                  'القاهرة',
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
                                                                        'العنوان:',
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
                                                                      const Text(
                                                                        'الزمالك',
                                                                        style:
                                                                            TextStyle(
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
                                                                        'السعر:',
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
                                                                        '${value.docs[index].get('price')} جنيهاَ',
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
                                                                          () {},
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .blue,
                                                                          minimumSize: Size(
                                                                              150,
                                                                              40)),
                                                                      child:
                                                                          const Text(
                                                                        "الغاء",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      )),
                                                                  ElevatedButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .blue,
                                                                          minimumSize: const Size(
                                                                              150,
                                                                              40)),
                                                                      child:
                                                                          const Text(
                                                                        "تغيير ميعاد الحجز ",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12,
                                                                        ),
                                                                      )),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                          error:
                                              (Object error, StackTrace err) {
                                            return const Text(
                                                "Error loading your plans");
                                          },
                                          loading: () {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                          // Container(
                                          //   child: ListView(
                                          //     scrollDirection: Axis.horizontal,
                                          //     children: [],
                                          //   ),
                                          // ),
                                        ),
                                        EventData.when(
                                          data: (value) => SafeArea(
                                            child: Container(
                                              height: 500.0,
                                              child: TabBarView(
                                                children: [
                                                  //Now let's create our first tab page
                                                  Container(
                                                    child: ListView.builder(
                                                        itemCount:
                                                            value.docs.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 10.0,
                                                                    right: 10.0,
                                                                    top: 10.0),
                                                            child: Card(
                                                              margin: EdgeInsets
                                                                  .zero,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          'سجي',
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.bold,
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
                                                                      height:
                                                                          10.0,
                                                                    ),
                                                                    ListView.builder(
                                                                        shrinkWrap: true,
                                                                        physics: const NeverScrollableScrollPhysics(),
                                                                        itemCount: 1,
                                                                        itemBuilder: (BuildContext context, int index) {
                                                                          return Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(bottom: 10.0),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 30,
                                                                                  width: 30,
                                                                                  child: Image.asset(
                                                                                    'assets/doctor_1.jpg',
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                                const SizedBox(
                                                                                  width: 10,
                                                                                ),
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    const SizedBox(
                                                                                      height: 10,
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 200,
                                                                                      child: Text(
                                                                                        'القاهرة',
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
                                                                      height:
                                                                          10.0,
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
                                                                              'العنوان:',
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              'الزمالك',
                                                                              style: const TextStyle(
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          children: [
                                                                            // ignore: prefer_const_constructors
                                                                            Text(
                                                                              'السعر:',
                                                                              style: const TextStyle(
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                            Text(
                                                                              '${value.docs[index].get('price')} جنيهاَ',
                                                                              style: const TextStyle(
                                                                                fontSize: 13,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          10.0,
                                                                    ),
                                                                    Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          ElevatedButton(
                                                                              onPressed: () {},
                                                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(150, 40)),
                                                                              child: const Text(
                                                                                "رؤية نتائجي",
                                                                                style: TextStyle(
                                                                                  fontSize: 12,
                                                                                ),
                                                                              )),
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
                                          error:
                                              (Object error, StackTrace err) {
                                            return const Text(
                                                "Error loading your plans");
                                          },
                                          loading: () {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          },
                                        )
                                      ],
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
