import 'package:easypark/provider/doctor_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/doctorModel.dart';

class deleteDoctorAr extends ConsumerStatefulWidget {
  deleteDoctorAr({Key? key});

  @override
  ConsumerState<deleteDoctorAr> createState() => _CrudPlaceState();
}

class _CrudPlaceState extends ConsumerState<deleteDoctorAr> {
  final drModel = DoctorModel();
  @override
  Widget build(BuildContext context) {
    final plcRead = ref.watch(doctorsDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة أطباء ايزي بارك'),
        backgroundColor: Colors.blue,
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/ar/admin');
          },
          child: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: plcRead.when(
        data: (value) => SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'اسم الدكتور: ${value.docs[index].get('nameAr')}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 10.0),
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 50,
                                            child: Image.asset(
                                              'assets/images/doc.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              SizedBox(
                                                width: 285,
                                                child: Text(
                                                  '${value.docs[index].get('cityAr')}',
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
                                    )),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                          '${value.docs[index].get('locationAr')}',
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
                                          '${value.docs[index].get('price')}',
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
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              content: const Text(
                                                  "هل أنت متأكد أنك تريد حذف ذلك؟"),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () async {
                                                    await drModel.deleteDoctor(
                                                        id: value
                                                            .docs[index].id);
                                                    //no navigation needed cuz Stream is used , it will update automaically
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    color: const Color.fromARGB(
                                                        255, 184, 195, 184),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("نعم"),
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(ctx).pop();
                                                  },
                                                  child: Container(
                                                    color: const Color.fromARGB(
                                                        255, 184, 195, 184),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: const Text("لا"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            // ignore: prefer_const_constructors
                                            backgroundColor: Colors.blue,
                                            minimumSize: Size(150, 40)),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          "احذف",
                                          style: const TextStyle(
                                            fontSize: 12,
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
              )
            ],
          ),
        ),
        //prints the error instead of red page error and loading when internet
        error: (Object error, StackTrace err) {
          return const Text("Error loading your list");
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
