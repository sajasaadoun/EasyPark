import 'package:easypark/model/data_doctor.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../model/doctor_static_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../screens/doctor_info.dart';
import '../provider/doctor_provider.dart';
import '../provider/patientInfo_provider.dart';
import '../screens/doctor_info_screen.dart';

class PatientsList extends ConsumerStatefulWidget {
  const PatientsList({Key? key}) : super(key: key);

  @override
  ConsumerState<PatientsList> createState() => _NearbyPatientsScreenState();
}

class _NearbyPatientsScreenState extends ConsumerState<PatientsList> {
  @override
  Widget build(BuildContext context) {
    final patients = ref.watch(patientInfoProvider);
    return patients.when(
        data: (value) => SafeArea(
              child: Column(
                children: List.generate(value.docs.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'doctor',
                          arguments: index,
                        );
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/user (3).png'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${value.docs[index].get('name')}",
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                    "${value.docs[index].get('Age')} Years Old"),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'report',
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
