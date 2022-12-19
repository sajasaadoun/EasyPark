import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Sections extends StatelessWidget {
  final icon;
  final String choice;
  final String choice2;
  final Color;
  const Sections({
    Key? key,
    required this.icon,
    required this.choice,
    required this.choice2,
    required this.Color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
          onPressed: () {
            if (choice2 == 'Patients') {
              Navigator.pushNamed(context, '/quiz_screen');
            } else if (choice2 == 'Doctors') {
              Navigator.pushNamed(context, '/');
            } else if (choice2 == 'Questionnaire') {
              Navigator.pushNamed(context, '/');
            }
          },
          // padding: const EdgeInsets.all(16),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 10, fontStyle: FontStyle.normal),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Color,
                  child: Icon(
                    icon,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  choice,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  choice2 + ' Test',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
