import 'package:easypark/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PatientsList extends ConsumerStatefulWidget {
  const PatientsList({Key? key}) : super(key: key);
  @override
  ConsumerState<PatientsList> createState() => _NearbyPatientsScreenState();
}

class _NearbyPatientsScreenState extends ConsumerState<PatientsList> {
  @override
  Widget build(BuildContext context) {
    // final patients = ref.watch(userDataProvider);
    return Container(
      child: Consumer(builder: (_, ref, __) {
      return ref.watch(userDataProvider).when(
        data: (value) => SafeArea(
          child: ListView.builder(
            itemCount: value.docs.length,
            itemBuilder: (context, index) {
              return Column(children: [
                // List.generate(value.docs.length, (index) {
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        'doctor',
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
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text("${value.docs[index].get('age')} Years Old"),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            final patientID = value.id;
                            Navigator.pushNamed(context, 'report',
                                arguments: patientID);
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
                ),
              ]);
            },
          ),
        ),
        error: (Object error, StackTrace stackTrace) {
          return const Text("Error loading your Questions");
        },
        loading: () {
          return const CircularProgressIndicator();
        },
      );
      }
    ));
  }
}
