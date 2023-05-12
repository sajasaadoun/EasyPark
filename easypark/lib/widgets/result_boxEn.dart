import 'package:flutter/material.dart';
// import '../constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  }) : super(key: key);
  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  // final int! finalResult = (result / questionLength) as int;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: Colors.white, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                result <= 1
                    ? 'Mild' // when the result is half of the questions
                    : result > 3
                        ? 'Severe' // when the result is less than half
                        : 'Moderate ',
                style: const TextStyle(fontSize: 30.0),
              ),
              radius: 70.0,
              // backgroundColor: result == questionLength / 2
              //     ? Colors.yellow // when the result is half of the questions
              //     : result < questionLength / 2
              //         ? Colors.green // when the result is less than half
              //         : Colors.red, // when the result is more than half
            ),
            const SizedBox(height: 20.0),
            Text(
              result == 0
                  ? 'No worries results' // when the result is half of the questions
                  : result < 3
                      ? 'No worries, Should follow up with Doctor' // when the result is less than half
                      : 'Should see doctor Immediately ', // when the result is more than half
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                ),
                child: const Text('Finish')),
          ],
        ),
      ),
    );
  }
}
