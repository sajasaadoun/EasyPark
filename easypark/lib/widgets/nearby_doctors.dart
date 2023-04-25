import 'package:easypark/model/data_doctor.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../model/doctor_static_model.dart';
// import '../screens/doctor_info.dart';
import '../screens/doctor_info_screen.dart';

class NearbyDoctors extends StatelessWidget {
  const NearbyDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyDoctors.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DoctorInfo(model: staticModel), //nearbyDoctors[index]
                ),
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
                        "Dr. ${nearbyDoctors[index].name}",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text("General practitioner"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Icon(
                            Ionicons.star,
                            color: Colors.yellow[700],
                            size: 18,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 4, right: 6),
                            child: Text(
                              "4.0",
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorInfo(
                            model: staticModel), //nearbyDoctors[index]
                      ),
                    );
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
    );
  }
}
