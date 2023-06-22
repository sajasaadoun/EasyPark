import 'package:easypark/screens/test_selection.dart';
import 'package:flutter/material.dart';

class InstructionsPage extends StatefulWidget {
  @override
  _InstructionsPageState createState() => _InstructionsPageState();
}

class _InstructionsPageState extends State<InstructionsPage> {
  int currentInstructionIndex = 0;
  List<String> instructions = [
    'Step 1: Draw a spiral or a normal wave on a piece of paper or directly on the phone.',
    'Step 2: Record a 30-second voice clip of your own voice or upload it.',
    'Step 3: Upload three images of your face: one smiling, one disgusted, and one surprised.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Instructions'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              instructions[currentInstructionIndex],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (currentInstructionIndex < instructions.length - 1) {
                setState(() {
                  currentInstructionIndex++;
                });
              } else {
                // Navigate to the test selection page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestSelectionScreen()),
                );
              }
            },
            child: Text(
              currentInstructionIndex < instructions.length - 1
                  ? 'Next'
                  : 'Start Test',
            ),
          ),
        ],
      ),
    );
  }
}

class TestSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Selection'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // TODO: Implement the test selection logic here
          },
          child: Text('Start Test'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InstructionsPage(),
  ));
}
