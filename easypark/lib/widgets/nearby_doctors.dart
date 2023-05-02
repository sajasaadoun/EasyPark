import 'package:easypark/model/data_doctor.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../model/doctor_model.dart';
import '../model/doctor_static_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../screens/doctor_info.dart';
import '../provider/doctor_provider.dart';
import '../screens/doctor_info_screen.dart';

class NearbyDoctors extends ConsumerStatefulWidget {
  const NearbyDoctors({Key? key}) : super(key: key);

  @override
  ConsumerState<NearbyDoctors> createState() => _NearbyDoctorsScreenState();
}

class _NearbyDoctorsScreenState extends ConsumerState<NearbyDoctors> {
  @override
  Widget build(BuildContext context) {
    final Doctors = ref.watch(doctorsDataProvider);
    return Doctors.when(
        data: (value) => SafeArea(
              child: Column(
                children: List.generate(value.docs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'DoctorsInfo',
                          arguments: index,
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(nearbyDoctors[index].profile),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dr. ${value.docs[index].get('name')}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text("${value.docs[index].get('location')}"),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.star,
                                      color: Colors.yellow[700],
                                      size: 18,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 4, right: 6),
                                      child: Text(
                                        "4.0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Text("195 Reviews")
                                  ],
                                )
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'DoctorsInfo',
                                  arguments: index);
                            },
                            child: Text(
                              "View",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
        error: (Object error, StackTrace stackTrace) {
          return const Text("Error loading your plans");
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        });
  }
}
