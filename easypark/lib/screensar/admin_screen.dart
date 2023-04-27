import 'package:flutter/material.dart';

import '../widgets/admin_model.dart';

class MyAdmin extends StatelessWidget {
  const MyAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    var expanded = Expanded(
      child: Container(
          padding: const EdgeInsets.all(25),
          color: const Color.fromARGB(255, 5, 50, 80),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text(
                      "Sections",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    const Icon(Icons.more_horiz)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // list view of excercices
                Expanded(
                  child: ListView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Sections(
                        icon: Icons.account_circle_rounded,
                        choice: 'patiens',
                        choice2: 'Patients',
                        Color: Colors.orangeAccent,
                      ),
                      // ignore: prefer_const_constructors
                      Sections(
                        icon: Icons.person_add_alt_1_rounded,
                        choice: 'Doctors',
                        choice2: 'Doctors',
                        Color: Colors.pink,
                      ),
                      // ignore: prefer_const_constructors
                      Sections(
                        icon: Icons.text_snippet_rounded,
                        choice: 'Questionnaire',
                        choice2: 'Questionnaire',
                        Color: Colors.green,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
    return expanded;
  }
}
