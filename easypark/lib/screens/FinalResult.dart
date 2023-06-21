import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String resultText1;
  final String resultText2;
  final String resultText3;

  ResultPage({
    required this.resultText1,
    required this.resultText2,
    required this.resultText3,
  });

  String getResultText() {
    final results = [resultText1, resultText2, resultText3];
    final parkinsonCount =
        results.where((result) => result == 'Parkinson').length;
    final healthyCount = results.where((result) => result == 'Healthy').length;

    if (parkinsonCount == 3) {
      return "You definitely have Parkinson's disease.";
    } else if (parkinsonCount == 1 && healthyCount == 2) {
      return "You might have Parkinson's disease.";
    } else if (healthyCount == 3) {
      return "You are healthy.";
    } else {
      return "Result inconclusive. Please consult a medical professional.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parkinson Detection Result'),
      ),
      body: Center(
        child: Text(
          getResultText(),
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
