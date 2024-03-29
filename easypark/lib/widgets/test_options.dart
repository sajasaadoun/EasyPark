import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestOptions extends StatelessWidget {
  final icon;
  final String option;
  final String option1;
  final Color;
  const TestOptions({
    Key? key,
    required this.icon,
    required this.option,
    required this.option1,
    required this.Color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
          onPressed: () {
            if (option1 == 'Hand-drawn') {
              Navigator.pushNamed(context, '/');
            } else if (option1 == 'Voice speech') {
              Navigator.pushNamed(context, '/speech');
            } else if (option1 == 'Face Picture') {
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
                  padding: const EdgeInsets.all(18),
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
                  textAlign: TextAlign.center,
                  option,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    textAlign: TextAlign.center,
                    option1 + ' Test',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ])),
    );
  }
}
